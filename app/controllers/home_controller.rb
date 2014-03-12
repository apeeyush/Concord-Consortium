require 'json'

class HomeController < ApplicationController
  def index
  end

  def data
    if @log_data == nil
  	  @log_data=LogDatum.all
    end
  end

  def post_data
    data = params[:data]
    @data = data
    @count = 0
	  array = JSON.parse(data)
    ActiveRecord::Base.transaction do
    array.each do |a|
      new_log = LogDatum.new
      new_log.session = a['session']
      new_log.event = a['event']
      new_log.time = a['time']
      new_log.timeDrift = a['timeDrift']
  		new_log.save
  		@count = @count + 1
	  end
  end
    render action: "index"
  end

  def analysis
  end

  def about
  end

  def delete_all_data
    ActiveRecord::Base.transaction do
      LogDatum.destroy_all
    end
    render action: "index"
  end

  def started_challenge
    @log_data = LogDatum.where("event='Started challenge'")
    render action: "data"
  end

  def spent_time
    @log_data = LogDatum.where("event='User logged in' or event='User logged out'").order(:session)
    render action: "data"
  end
end