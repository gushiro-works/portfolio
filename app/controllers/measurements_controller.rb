class MeasurementsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def index
    redirect_to root_path
  end
  
  def show
    @measurement = Measurement.find(params[:id])
    @records = current_user.records.where(measurement_id: params[:id])
    @allrecords = Record.where(measurement_id: params[:id])
    @users_and_records = @allrecords.map do |allrecord|
      [allrecord.user_id, [allrecord]]
    end
  end

  def new
    @measurement = Measurement.new
  end

  def create
    @measurement = current_user.measurements.new(measurement_params)
    @measurement.users << current_user
    if @measurement.save
      flash[:success] = "新しい計測の追加に成功しました"
      redirect_to root_url
    else
      flash[:danger] = "新しい計測の追加に失敗しました"
      @feed_items = current_user.measurements.paginate(page: params[:page])#@feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
    # /        => DELETE
    # /users/1 => DELETE
  end

  private
    
    def measurement_params
      params.require(:measurement).permit(:event, :unit, :value_type)
    end

    def correct_user
      @measurement = current_user.measurements.find_by(id: params[:id])
      redirect_to root_url if @measurement.nil?
    end
end
