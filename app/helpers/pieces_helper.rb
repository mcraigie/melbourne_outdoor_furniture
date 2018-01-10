module PiecesHelper
  def piece_fields
    {
      gis_identifier: { title: 'GIS ID', symbol_string: 'gis_identifier' },
      description: { title: 'Description', symbol_string: 'description' },
      condition: { title: 'Condition', symbol_string: 'condition' },
      evaluated: { title: 'Evaluated', symbol_string: 'evaluated' },
      type_id: { title: 'Type', symbol_string: 'type_id' },
      model_id: { title: 'Model', symbol_string: 'model_id' },
      division_id: { title: 'Division', symbol_string: 'division_id' },
      suburb_id: { title: 'Suburb', symbol_string: 'suburb_id' }
    }
  end

  def invert(direction)
    direction.to_s == 'ASC' ? 'DESC' : 'ASC'
  end

  def sort_arrow(direction)
    direction.to_s == 'ASC' ? '▲' : '▼'
  end
end
