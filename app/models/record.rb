class Record < ApplicationRecord
  belongs_to :user
  belongs_to :measurement
  
  validates :user,
    presence: true
  validates :measurement,
    presence: true
  validates :value,
    presence: true
end
