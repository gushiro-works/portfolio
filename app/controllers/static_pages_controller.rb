class StaticPagesController < ApplicationController
  def home
    if logged_in?
      #@measurement  = current_user.measurements.build　　measurementsコントローラのnewアクションで行っているのでコメントアウト
      @my_measurements = current_user.measurements.group(:measurement_id).paginate(page: params[:page])
      @records = current_user.records
      @period = (0..6).to_a.map {|i| (Time.now - (6-i).days).strftime("%Y/%m/%d""(#{ %w(日 月 火 水 木 金 土)[(Time.now - (6-i).days).wday]})")}
  
    end

    # app/views/リソース名/アクション名.html.erb
    # app/views/static_pages/home.html.erb
  end

  def help
  end

  def about
    # 'app/views/static_pages/about.html.erb'
  end

  def contact
    # app/views/static_pages/contact.html.erb'
  end
end
