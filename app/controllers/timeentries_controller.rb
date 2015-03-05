class TimeentriesController < ApplicationController
  before_action :set_timeentry, only: [:show, :edit, :update, :destroy]

  # GET /timeentries
  # GET /timeentries.json
  def index
    @timeentries = Timeentry.all
  end

  # GET /timeentries/1
  # GET /timeentries/1.json
  def show
  end

  # GET /timeentries/new
  def new
    @timeentry = Timeentry.new
  end

  # GET /timeentries/1/edit
  def edit
  end

  # POST /timeentries
  # POST /timeentries.json
  def create
    @timeentry = Timeentry.new(timeentry_params)

    respond_to do |format|
      if @timeentry.save
        format.html { redirect_to @timeentry, notice: 'Timeentry was successfully created.' }
        format.json { render :show, status: :created, location: @timeentry }
      else
        format.html { render :new }
        format.json { render json: @timeentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /timeentries/1
  # PATCH/PUT /timeentries/1.json
  def update
    respond_to do |format|
      if @timeentry.update(timeentry_params)
        format.html { redirect_to @timeentry, notice: 'Timeentry was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeentry }
      else
        format.html { render :edit }
        format.json { render json: @timeentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /timeentries/1
  # DELETE /timeentries/1.json
  def destroy
    @timeentry.destroy
    respond_to do |format|
      format.html { redirect_to timeentries_url, notice: 'Timeentry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeentry
      @timeentry = Timeentry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def timeentry_params
      params.require(:timeentry).permit(:time, :date, :user_id, :contract_id)
    end
end
