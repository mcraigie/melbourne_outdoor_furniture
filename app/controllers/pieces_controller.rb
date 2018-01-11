class PiecesController < ApplicationController
  before_action :set_piece, only: %i[show]

  # GET /pieces
  # GET /pieces.json
  def index
    scope = Piece

    if search_params[:query].present?
      scope = scope.where([
                            'description LIKE ? OR gis_identifier LIKE ?',
                            "%#{search_params[:query]}%",
                            "%#{search_params[:query]}%"
                          ])
    end

    associated_models = %i[type division suburb model]
    other_sortable_fields = %w[description gis_identifier condition evaluated created_at updated_at]

    associated_models.map { |m| "#{m}_id" }.each do |model|
      scope = scope.where(model => search_params[model]) if search_params[model].present?
    end

    scope = scope.includes(associated_models)

    scope = if associated_models.map(&:to_s).include?(search_params[:sort_by])
              scope.order("#{search_params[:sort_by]}s.name #{search_params[:sort_dir]}")
            elsif other_sortable_fields.include?(search_params[:sort_by])
              scope.order(search_params[:sort_by] => search_params[:sort_dir] || 'ASC')
            else
              scope.order(gis_identifier: search_params[:sort_dir] || 'ASC')
            end

    @pieces = scope.all
  end

  # GET /pieces/1
  # GET /pieces/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_piece
    @piece = Piece.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def search_params
    params.permit(%i[
                    description
                    gis_identifier
                    condition
                    evaluated
                    type_id
                    division_id
                    suburb_id
                    model_id
                    query
                    sort_by
                    sort_dir
                  ])
  end
end
