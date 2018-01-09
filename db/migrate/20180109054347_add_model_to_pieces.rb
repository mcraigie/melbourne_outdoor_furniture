class AddModelToPieces < ActiveRecord::Migration[5.1]
  def change
    add_reference :pieces, :model, foreign_key: true
  end
end
