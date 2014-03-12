require 'json'

class HomeController < ApplicationController
  def index
  end

  def data
  	@log_data=LogDatum.all
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
end