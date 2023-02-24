class ConceptMatchesController < ApplicationController
  before_action :set_concept_match, only: %i[ show edit update destroy ]

  # GET /concept_matches or /concept_matches.json
  def index
    @concept_matches = ConceptMatch.all
  end

  # GET /concept_matches/1 or /concept_matches/1.json
  def show
  end

  # GET /concept_matches/new
  def new
    @concept_match = ConceptMatch.new
    @concepts = Concept.all
    @options = Option.all
  end

  # GET /concept_matches/1/edit
  def edit
    @concepts = Concept.all
    @options = Option.all
  end

  # POST /concept_matches or /concept_matches.json
  def create
    @concept_match = ConceptMatch.new(concept_match_params)

    respond_to do |format|
      if @concept_match.save
        format.html { redirect_to concept_match_url(@concept_match), notice: "Concept match was successfully created." }
        format.json { render :show, status: :created, location: @concept_match }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @concept_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concept_matches/1 or /concept_matches/1.json
  def update
    respond_to do |format|
      if @concept_match.update(concept_match_params)
        format.html { redirect_to concept_match_url(@concept_match), notice: "Concept match was successfully updated." }
        format.json { render :show, status: :ok, location: @concept_match }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @concept_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concept_matches/1 or /concept_matches/1.json
  def destroy
    @concept_match.destroy

    respond_to do |format|
      format.html { redirect_to concept_matches_url, notice: "Concept match was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concept_match
      @concept_match = ConceptMatch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def concept_match_params
      params.require(:concept_match).permit(:concept_id, :option_id, :comment)
    end
end
