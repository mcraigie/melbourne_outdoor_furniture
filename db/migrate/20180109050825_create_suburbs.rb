class CreateSuburbs < ActiveRecord::Migration[5.1]
  def change
    create_table :suburbs do |t|
      t.string :name
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
