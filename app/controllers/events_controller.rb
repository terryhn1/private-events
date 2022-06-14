class EventsController < ApplicationController
    def index
        @events = Event.all.order("created_at DESC")
        @event = Event.new
    end

    def new
        @event = current_user.created_events.build
    end

    def show
        @event = Event.find(params[:id])
        @attendees = @event.attendee_ids
    end

    def create
        @event = current_user.created_events.build(event_params)

        respond_to do |format|
            if @event.save
                format.html{redirect_to root_path, notice: "Event was successfully created"}
                format.json{render :show, status: :created, location: @event}
            else
                format.html{render :new, status: :unprocessable_entity}
                format.json{render json: @event.errors, status: :unprocessable_entity}
            end
        end

    end

    def create_attendee

        @event_list = EventList.new(user_id: current_user.id, event_id: params[:id])

        respond_to do |format|
            if @event_list.save
                format.html{redirect_to root_path, notice: "Event List was successfully updated"}
                format.json{render :show, status: :created, location: @event_list}
            else
                format.html{render :new, status: :unprocessable_entity}
                format.json{render json: @event.errors, status: :unprocessable_entity}
            end
        end
    end


    private
        def set_event
            @event = Event.find(params[:id])
        end

        def event_params
            params.require(:event).permit(:event_name, :eventDate)
        end

end
