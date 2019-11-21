class Record < ApplicationRecord
  belongs_to :user
  belongs_to :measurement
=begin
  validates :user,
    presence: true
  validates :measurement,
    presence: true
  validates :record_value,
    presence: true
=end
end
