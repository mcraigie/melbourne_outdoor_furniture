# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'

File.read("./data/types.txt").each_line do |line|
  Type.create!(name: line.strip)
end

File.read("./data/divisions.txt").each_line do |line|
  Division.create!(name: line.strip)
end

File.read("./data/models.txt").each_line do |line|
  Model.create!(name: line.strip)
end

File.read("./data/suburbs.txt").each_line do |line|
  Suburb.create!(name: line.strip)
end

CSV.foreach("./data/subset_outdoor_furniture.csv", :headers => true) do |row|
  row = row.to_hash
  row['type'] = Type.find_by(name: row['type'])
  row['division'] = Division.find_by(name: row['division'])
  row['model'] = Model.find_by(name: row['model'])
  row['suburb'] = Suburb.find_by(name: row['suburb'])
  Piece.create!(row)
end
