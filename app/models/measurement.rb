class Measurement < ApplicationRecord
  has_many :records, dependent: :destroy
  has_many :users, through: :records
  
  default_scope -> { order(created_at: :desc) }
  
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
    
  def self.search(search)
    if search
      where(['event LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end