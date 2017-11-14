class VolunteerDescriptionsController < ApplicationController
  before_action :set_volunteer_description, only: [:show, :edit, :update, :destroy]

  # GET /volunteer_descriptions
  # GET /volunteer_descriptions.json
  def index
    @volunteer_descriptions = VolunteerDescription.all
  end

  # GET /volunteer_descriptions/1
  # GET /volunteer_descriptions/1.json
  def show
  end

  # GET /volunteer_descriptions/new
  def new
    @volunteer_description = VolunteerDescription.new
  end

  # GET /volunteer_descriptions/1/edit
  def edit
  end

  # POST /volunteer_descriptions
  # POST /volunteer_descriptions.json
  def create
    @volunteer_description = VolunteerDescription.new(volunteer_description_params)

    respond_to do |format|
      if @volunteer_description.save
        format.html { redirect_to @volunteer_description, notice: 'Volunteer description was successfully created.' }
        format.json { render :show, status: :created, location: @volunteer_description }
      else
        format.html { render :new }
        format.json { render json: @volunteer_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volunteer_descriptions/1
  # PATCH/PUT /volunteer_descriptions/1.json
  def update
    respond_to do |format|
      if @volunteer_description.update(volunteer_description_params)
        format.html { redirect_to @volunteer_description, notice: 'Volunteer description was successfully updated.' }
        format.json { render :show, status: :ok, location: @volunteer_description }
      else
        format.html { render :edit }
        format.json { render json: @volunteer_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volunteer_descriptions/1
  # DELETE /volunteer_descriptions/1.json
  def destroy
    @volunteer_description.destroy
    respond_to do |format|
      format.html { redirect_to volunteer_descriptions_url, notice: 'Volunteer description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volunteer_description
      @volunteer_description = VolunteerDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volunteer_description_params
      params.require(:volunteer_description).permit(:volunteerId, :infoVolunteer, :datesAvail)
    end
end
