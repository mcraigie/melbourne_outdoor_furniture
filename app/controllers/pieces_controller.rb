class PiecesController < ApplicationController
  before_action :set_piece, only: %i[show edit update destroy]

  # GET /pieces
  # GET /pieces.json
  def index
    scope = Piece

    if params[:query].present?
      scope = scope.where([
                            'description LIKE ? OR gis_identifier LIKE ?',
                            "%#{params[:query]}%",
                            "%#{params[:query]}%"
                          ])
    end

    associated_models = %i[type division suburb model]
    sortable_fields = %w[description gis_identifier condition evaluated created_at updated_at]

    associated_models.each do |model|
      scope = scope.where(model => params[model]) if params[model].present?
    end

    scope = scope.includes(associated_models)

    scope = if params[:sort_by].present? && associated_models.include?(params[:sort_by].to_sym)
              scope.order("#{params[:sort_by]}s.name #{params[:sort_dir]}")
            elsif sortable_fields.include?(params[:sort_by])
              scope.order(params[:sort_by].to_sym => params[:sort_dir] || 'ASC')
            else
              scope.order(gis_identifier: params[:sort_dir] || 'ASC')
            end

    @pieces = scope.all
  end

  # GET /pieces/1
  # GET /pieces/1.json
  def show; end

  # GET /pieces/new
  def new
    @piece = Piece.new
  end

  # GET /pieces/1/edit
  def edit; end

  # POST /pieces
  # POST /pieces.json
  def create
    @piece = Piece.new(piece_params)

    respond_to do |format|
      if @piece.save
        format.html { redirect_to @piece, notice: 'Piece was successfully created.' }
        format.json { render :show, status: :created, location: @piece }
      else
        format.html { render :new }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pieces/1
  # PATCH/PUT /pieces/1.json
  def update
    respond_to do |format|
      if @piece.update(piece_params)
        format.html { redirect_to @piece, notice: 'Piece was successfully updated.' }
        format.json { render :show, status: :ok, location: @piece }
      else
        format.html { render :edit }
        format.json { render json: @piece.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pieces/1
  # DELETE /pieces/1.json
  def destroy
    if @pieces.destroy
      respond_to do |format|
        format.html { redirect_to pieces_url, notice: 'Piece was successfully destroyed.' }
        format.json { head :ok, status: :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to pieces_url }
        format.json { head :no_content, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_piece
    @piece = Piece.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def piece_params
    params.require(:piece).permit(%i[
                                    description
                                    gis_identifier
                                    condition
                                    evaluated
                                    lat
                                    long
                                    type_id
                                    division_id
                                    suburb_id
                                    model_id
                                  ])
  end
end
