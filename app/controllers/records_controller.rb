class RecordsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  #before_action :correct_user,   only: :destroy

  def index
    redirect_to root_path
  end

  def new
    @record = Record.new
  end

  def create
    @measurement = Measurement.find(params[:measurement_id])
    @record = @measurement.records.build(record_params)
    @record.user_id = current_user.id
    if @record.save
      flash[:success] = "新しい記録の追加に成功しました"
      redirect_to root_url
    else
      flash[:danger] = "新しい記録の追加に失敗しました"
      @feed_items = current_user.measurements.paginate(page: params[:page])#@feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end
  
  private
    
    def record_params
      params.require(:record).permit(:record_value)
    end
    
end
