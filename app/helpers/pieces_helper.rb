module PiecesHelper
  def piece_fields
    {
      gis_identifier: { title: 'GIS ID', query_string: 'gis_identifier' },
      description: { title: 'Description', query_string: 'description' },
      condition: { title: 'Condition', query_string: 'condition' },
      evaluated: { title: 'Evaluated', query_string: 'evaluated' },
      type_id: { title: 'Type', query_string: 'type' },
      model_id: { title: 'Model', query_string: 'model' },
      division_id: { title: 'Division', query_string: 'division' },
      suburb_id: { title: 'Suburb', query_string: 'suburb' }
    }
  end

  def invert(direction)
    direction.to_s == 'ASC' ? 'DESC' : 'ASC'
  end

  def sort_arrow(direction)
    direction.to_s == 'ASC' ? '▲' : '▼'
  end
end
