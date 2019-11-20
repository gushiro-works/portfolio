class MeasurementsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def new
    @measurement = Measurement.new
    @measurement.users << current_user
  end

  def create
    @measurement = Measurement.new(measurement_params)#@measurement = current_user.measurements.new(measurement_params)
    current_user.records.build(record_params)
    #@record = current_user.records.where(measurement_id: params[:id])
    #@record.value = "hoge"
    if @measurement.save
      flash[:success] = "新しい計測の追加に成功しました"
      redirect_to root_url
    else
      flash[:danger] = "新しい計測の追加に失敗しました"
      @feed_items = current_user.feed.paginate(page: params[:page])
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
