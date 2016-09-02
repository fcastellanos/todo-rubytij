class User < ApplicationRecord
  validates :first_name, presence: true
  validates :city, presence: true
end
