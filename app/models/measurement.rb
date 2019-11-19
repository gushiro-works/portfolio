class Measurement < ApplicationRecord
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id,
    presence: true
  validates :event,
    presence: true
=begin
    ,
    length: {maximum: 20}
  validates :unit,
    presence: true,
    length: {maximum: 10}
  validates :type,
    presence: true
=end
    
end
