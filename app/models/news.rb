class News < ApplicationRecord
  validates :title, :short_description, :description, presence: true
end
