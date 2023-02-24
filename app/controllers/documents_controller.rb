require 'csv'

class DocumentsController < ApplicationController
  before_action :set_document, only: %i[ show edit update destroy process_csv load_patients ]

  # GET /documents or /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1 or /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents or /documents.json
  def create
    @document = Document.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to document_url(@document), notice: "Document was successfully created." }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1 or /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to document_url(@document), notice: "Document was successfully updated." }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1 or /documents/1.json
  def destroy
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url, notice: "Document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def process_csv
    @document.fields.destroy_all
    csv = CSV.parse(@document.file.download, headers: true)
    csv.headers.each do |header|
      field = Field.new(name: header, document: @document)
      field.save
    end
    @document.processed = true
    @document.save
    respond_to do |format|
      format.html { redirect_to document_url(@document), notice: "All fields processed." }
      format.json { render :show, status: :ok, location: @document }
    end
  end

  def load_patients
    count = 0
    respond_to do |format|
      format.html { redirect_to document_url(@document), notice: "#{count} Patients created." }
      format.json { render :show, status: :ok, location: @document }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:preview, :collection_id, :file)
    end
end
