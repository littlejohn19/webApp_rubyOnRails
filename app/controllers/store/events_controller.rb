module Store
  class EventsController < StoreController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    # GET /events
    # GET /events.json
    def index
      @events = Event.all
    end

    # GET /events/1
    # GET /events/1.json
    def show
      @event = Event.friendly.find(params[:id])
    end

  end

end
