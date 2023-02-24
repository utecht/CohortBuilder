class FieldGroupsController < ApplicationController
  before_action :set_field_group, only: %i[ show edit update destroy ]
  before_action :set_document, only: %i[ new edit ]

  # GET /field_groups or /field_groups.json
  def index
    @field_groups = FieldGroup.all
  end

  # GET /field_groups/1 or /field_groups/1.json
  def show
  end

  # GET /field_groups/new
  def new
    @field_group = FieldGroup.new
    @documents = Document.all
  end

  # GET /field_groups/1/edit
  def edit
    @documents = Document.all
  end

  # POST /field_groups or /field_groups.json
  def create
    @field_group = FieldGroup.new(field_group_params)

    respond_to do |format|
      if @field_group.save
        format.html { redirect_to field_group_url(@field_group), notice: "Field group was successfully created." }
        format.json { render :show, status: :created, location: @field_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @field_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_groups/1 or /field_groups/1.json
  def update
    respond_to do |format|
      if @field_group.update(field_group_params)
        format.html { redirect_to field_group_url(@field_group), notice: "Field group was successfully updated." }
        format.json { render :show, status: :ok, location: @field_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @field_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_groups/1 or /field_groups/1.json
  def destroy
    @field_group.destroy

    respond_to do |format|
      format.html { redirect_to field_groups_url, notice: "Field group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_group
      @field_group = FieldGroup.find(params[:id])
    end

    def set_document
      @document = Document.find(params[:document_id])
    end

    # Only allow a list of trusted parameters through.
    def field_group_params
      params.require(:field_group).permit(:name, :description, :document_id)
    end
end
