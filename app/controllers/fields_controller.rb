require 'csv'

class FieldsController < ApplicationController
  before_action :set_field, only: %i[ show edit update destroy create_records ]

  # GET /fields or /fields.json
  def index
    @fields = Field.all
  end

  # GET /fields/1 or /fields/1.json
  def show
  end

  # GET /fields/new
  def new
    @field = Field.new
  end

  # GET /fields/1/edit
  def edit
  end

  # POST /fields or /fields.json
  def create
    @field = Field.new(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to field_url(@field), notice: "Field was successfully created." }
        format.json { render :show, status: :created, location: @field }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fields/1 or /fields/1.json
  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to document_url(@field.document), notice: "Field was successfully updated." }
        format.json { render :show, status: :ok, location: @field }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fields/1 or /fields/1.json
  def destroy
    @field.destroy

    respond_to do |format|
      format.html { redirect_to fields_url, notice: "Field was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def create_records
    @field.records.destroy_all
    count = 0
    id_column = @field.ctype == 'id' ? @field.name : @field.document.id_column
    return "No patient ID yet kind of error" if id_column.nil?
    csv = CSV.parse(@field.document.file.download, headers: true)
    csv.each do |row|
      patient = Patient.find_or_create_by(patient_id: row[id_column], collection: @field.document.collection)
      if @field.ctype != 'id' then
        value = row[@field.name]
        @field.create_record(patient, value)
      end
      count += 1
      @field.processed = true
      @field.save
    end
    respond_to do |format|
      format.html { redirect_to document_url(@field.document), notice: "#{count} Records created." }
      format.json { render :show, status: :ok, location: @field }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field
      @field = Field.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def field_params
      params.require(:field).permit(:ctype, :example, :stats, :description, :document_id)
    end
end
