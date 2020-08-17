class OurWork < ApplicationRecord
  validates :title, :description, presence: true
end
