require 'json'
require 'time'

class HomeController < ApplicationController
  def index
  end

  def data
    if @log_data == nil
  	  @log_data=LogDatum.all
    end
#    DateTime.strptime("#{s}",'%s').in_time_zone("Eastern Time (US & Canada)"
#    s = log_datum.time/1000
  end

  def group_view
    @log_data = LogDatum.order(:time).order(:session)
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
        new_log.parameters = a['parameters'].to_s
        if new_log.save
          @update = "Data Entered Successfully!"
        end
  		  @count = @count + 1
	    end
    end
    render action: "index"
  end

  def analysis
    @uniq_events = LogDatum.uniq.pluck(:event)
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
    @log_data = LogDatum.where("event='User logged in' or event='User logged out'").order(:time).order(:session)
    render action: "data"
  end

end