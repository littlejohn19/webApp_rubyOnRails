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

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :image, :description, :date, :slug)
    end

  end

end
