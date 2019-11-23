module RecordsHelper
  def helper_latest_record(measurement)
    current_user.records.find_by(measurement_id: measurement)
  end
end
