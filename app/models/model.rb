class Model < ApplicationRecord
  has_many :pieces, :dependent => :restrict_with_error
end
