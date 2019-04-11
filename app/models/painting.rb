class Painting < ApplicationRecord
  belongs_to :artist
  validates :name, uniqueness: true
end
