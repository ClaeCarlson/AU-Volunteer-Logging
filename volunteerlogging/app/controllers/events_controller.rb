class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy            ]
  before_action :authenticate_admin!, only: [:admin_cal, :createSections]
  respond_to :html, :js
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end


  def create_event
  end

  def admin_cal
    @volunteers = Volunteer.all
  end
  
  def sign_up    
    
    @hour = Hour.new(hour_params)
    
    signed = Volunteer.find_by_sql("select COUNT(*) from hours where volunteer_id = #{@hour.volunteer_id} && section_id =#{@hour.section_id}")
    
    respond_to do |format|
      if @hour.save
        format.json { render '/events/index' }
      else
        format.json { render '/events/index'}
      end
    end
  end

  def leave
    v_id =params["hour"]["volunteer_id"]
    section= params["hour"]["section_id"]
    hr_id = Hour.find_by_sql("select id from hours where section_id = #{section} and volunteer_id = #{v_id}")
              
    hour = Hour.find(hr_id[0].id)
    hour.destroy
    respond_to do |format|
      format.json { render '/events/index' }
    end
  end

  def createSections
    
    @event = params["event"]
    repeated = params["event_repeated"]
    @newevent = Event.new(event_params)
    @newevent.save
  
    startTime = event["start_time(4i)"].to_i
    endTime = event["end_time(4i)"].to_i
    
    num =  startTime + (endTime - startTime)
   
    eid = Event.find_by_sql("select id, repeated_id from events order by id desc limit 1")
    
     for i in startTime..num 
    
      params['section'] = {"start(1i)"=> event["start_time(1i)"],
                      "start(2i)" => event["start_time(2i)"],
                      "start(3i)" => event["start_time(3i)"],
                      "start(4i)" => "#{i}",
                      "start(5i)" => event["start_time(5i)"],
                      "end(1i)"=> event["end_time(1i)"],
                      "end(2i)" => event["end_time(2i)"],
                      "end(3i)" => event["end_time(3i)"],
                      "end(4i)" => "#{i + 1}",
                      "end(5i)" => event["end_time(5i)"],
                      "event_id" => eid[0].id,
                      "event_section" => "#{i + 1 - startTime}"
                      
                     }
                     puts params['section']
      section = Section.new(section_params)
      section.save
    end
    
    respond_to do |format|
      format.html {redirect_to "/admin_cal"}
      
    end
    
  end

  def showEvent
    @hour = Hour.new
    eid = params["id"]
    secs = Volunteer.find_by_sql("select id,start,end from sections where event_id = #{eid}")
    @descrition = Event.find_by_sql("select description from events where id = #{eid}")
    count = 0
    @dataHash = Hash.new
    @dataHash["desc"] = @descrition 
    @dataHash[0] = secs
    secs.each do |sec|
      @dataHash[sec.id] = Volunteer.find_by_sql("select firstName, lastName, id from
     volunteers where id in (select volunteer_id from hours where
     section_id in (select id from sections where id = #{sec.id}))")
     count = 1 + count
    end
    
    respond_to do |format|
      format.json {render json: @dataHash }

    end
  end

  def eventSections
    respond_to do |format|
      format.html {render "/event/"}
      format.json {render "/event/sections"}
    end
  end


  # GET /events/1
  # GET /events/1.json
  def show
  end


  
  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def updateCal
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start_time, :end_time, :numOfSections)
    end

    def hour_params
      params.require(:hour).permit(:hour_id, :hoursWorked, :weekWorked, :volunteer_id, :section_id)
    end

    def section_params
      
      params.require(:section).permit(:event_id, :start, :end, :event_section)
    end
end
