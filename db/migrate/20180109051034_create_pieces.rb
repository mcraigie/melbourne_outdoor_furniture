class CreatePieces < ActiveRecord::Migration[5.1]
  def change
    create_table :pieces do |t|
      t.string :description
      t.integer :gis_id
      t.float :condition
      t.date :evaluated
      t.float :lat
      t.float :long
      t.references :type, foreign_key: true
      t.references :division, foreign_key: true
      t.references :suburb, foreign_key: true

      t.timestamps
    end
  end
end
