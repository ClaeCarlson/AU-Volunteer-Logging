class EventRepreatedController < ApplicationController

    def create

        repeated_event = params["event_repeated"]

        repeated = Event_Repeated.new(repeated_event)

        repeated.save

    end
    
end
