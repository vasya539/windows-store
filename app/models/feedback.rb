class Feedback < ApplicationRecord
  validates :user_full_name, :users_email, :city, :feedback, presence: true
end
