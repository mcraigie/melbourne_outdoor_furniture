class Piece < ApplicationRecord
  belongs_to :type
  belongs_to :division
  belongs_to :suburb
  belongs_to :model
end
