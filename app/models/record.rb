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

  def self.last_records
    group("date(created_at)").having('created_at = MAX(created_at)')
  end
  
  
  def last_records_of_each_day(x)
    
#@data = { 'user1_id' => {'1日で最新の日付' => record_value },
#         'user2_id' => {'1日で最新の日付' => record_value },
  
#}    
    
    record_ids = "
      SELECT user_id, record_value, created_at
      FROM records
      WHERE user_id = :user_id"
    Measurement.where("user_id IN (#{record_ids})")
  end

end
