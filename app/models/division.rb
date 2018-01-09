class Division < ApplicationRecord
  has_many :pieces, :dependent => :restrict_with_error
end
