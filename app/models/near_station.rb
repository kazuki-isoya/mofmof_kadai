class NearStation < ApplicationRecord
  belongs_to :property, optional: true
end
