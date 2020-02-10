class Property < ApplicationRecord
  has_many :near_stations
  accepts_nested_attributes_for :near_stations, allow_destroy: true
  validates :name, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :age, presence: true
  validates :description, presence: true
end
