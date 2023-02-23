class ConceptsController < ApplicationController
  before_action :set_concept, only: %i[ show edit update destroy ]

  # GET /concepts or /concepts.json
  def index
    @concepts = Concept.all
  end

  # GET /concepts/1 or /concepts/1.json
  def show
  end

  # GET /concepts/new
  def new
    @concept = Concept.new
  end

  # GET /concepts/1/edit
  def edit
  end

  # POST /concepts or /concepts.json
  def create
    @concept = Concept.new(concept_params)

    respond_to do |format|
      if @concept.save
        format.html { redirect_to concept_url(@concept), notice: "Concept was successfully created." }
        format.json { render :show, status: :created, location: @concept }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concepts/1 or /concepts/1.json
  def update
    respond_to do |format|
      if @concept.update(concept_params)
        format.html { redirect_to concept_url(@concept), notice: "Concept was successfully updated." }
        format.json { render :show, status: :ok, location: @concept }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @concept.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concepts/1 or /concepts/1.json
  def destroy
    @concept.destroy

    respond_to do |format|
      format.html { redirect_to concepts_url, notice: "Concept was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concept
      @concept = Concept.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def concept_params
      params.require(:concept).permit(:obo_class, :label, :definition, :rdf_template)
    end
end
