class Profession < ApplicationRecord
  has_amd_belongs_to_many :users
end
