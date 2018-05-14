class Hotel < ApplicationRecord
  belongs_to :users
  belongs_to :cities
end
