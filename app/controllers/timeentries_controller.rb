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
    @timeentry.user = current_user
    
    params[:tags_string].split(" ").each do |tag_name|
      tag = Tag.where(name: tag_name).first
      if tag.nil?
        tag = Tag.create(name: tag_name)
      end
      @timeentry.tags << tag
    end
    
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
    
    new_tag_names = params[:tags_string].split(" ")
    old_tags = @timeentry.tags.all.to_a
    old_tag_names = old_tags.map(&:name)
    
    added_tag_names = new_tag_names.reject{ |new_tag_name| old_tag_names.include? new_tag_name}
    removed_tags = old_tags.reject{ |old_tag| new_tag_names.include? old_tag.name}
    
    added_tag_names.each do |tag_name|
      tag = Tag.where(name: tag_name).first
      if tag.nil?
        tag = Tag.create(name: tag_name)
      end
      @timeentry.tags << tag
    end
    
    @timeentry.tags.delete removed_tags
    removed_tags.each do |tag|
      if tag.timeentries.empty?
        tag.destroy
      end
    end
    
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
    
    removed_tags = @timeentry.tags.all.to_a
    @timeentry.destroy
    removed_tags.each do |tag|
      if tag.timeentries.empty?
        tag.destroy
      end
    end
    
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
      params.require(:timeentry).permit(:duration, :date, :user_id, :contract_id)
    end
end
