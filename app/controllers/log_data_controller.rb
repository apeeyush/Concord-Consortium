class LogDataController < ApplicationController
  before_action :set_log_datum, only: [:show, :edit, :update, :destroy]

  # GET /log_data
  # GET /log_data.json
  def index
    @log_data = LogDatum.all
  end

  # GET /log_data/1
  # GET /log_data/1.json
  def show
  end

  # GET /log_data/new
  def new
    @log_datum = LogDatum.new
  end

  # GET /log_data/1/edit
  def edit
  end

  # POST /log_data
  # POST /log_data.json
  def create
    @log_datum = LogDatum.new(log_datum_params)

    respond_to do |format|
      if @log_datum.save
        format.html { redirect_to @log_datum, notice: 'Log datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @log_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @log_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /log_data/1
  # PATCH/PUT /log_data/1.json
  def update
    respond_to do |format|
      if @log_datum.update(log_datum_params)
        format.html { redirect_to @log_datum, notice: 'Log datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @log_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_data/1
  # DELETE /log_data/1.json
  def destroy
    @log_datum.destroy
    respond_to do |format|
      format.html { redirect_to log_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_datum
      @log_datum = LogDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_datum_params
      params.require(:log_datum).permit(:session, :time, :timeDrift, :event)
    end
end
