module Admin
  class TicketsController < AdminController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]

    # GET /tickets
    # GET /tickets.json
    def index
      @tickets = current_user.tickets.all
    end

    # GET /tickets/1
    # GET /tickets/1.json
    def show
    end

    def buy_ticket
      event_id = params[:event_id]
      event = Event.find(event_id)
      user_id = params[:user_id]
      user = User.find(user_id)
      address = params[:address]
      price = params[:price].to_i
      email_address = params[:email_address]
      places = params[:places]
      name = params[:name]

      puts price

      ticket = Ticket.create(user_id: user_id, event_id: event_id, name: name, event_name: event.title,
                             address: address, price: price, email_address: email_address, places: places)

      user.money_state = user.money_state.to_i - price.to_i

      user.save()

      event.places = places
      event.save()

      redirect_to admin_tickets_path
    end

    def receive_ticket
      ticket_id = params[:id]
      user_id = current_user.id

      ticket = Ticket.find(ticket_id)
      user = User.find(user_id)
      event = Event.find(ticket.event_id)

      if ((I18n.l event.date, :format => "%d-%m-%Y") == Date.current.to_s)
        subract = ticket.price.to_i * 0.2
      else
        subract = ticket.price.to_i * 0.6
      end

      user.money_state = user.money_state + subract

      user.save()

      ticket.destroy

      redirect_to admin_tickets_path
    end

    # GET /tickets/new
    def new
      # @ticket = current_user.tickets.new
      @ticket = current_user.tickets.new
    end

    # GET /tickets/1/edit
    def edit
    end

    # POST /tickets
    # POST /tickets.json
    def create
      @ticket = current_user.tickets.new(ticket_params)

      respond_to do |format|
        if @ticket.save
          format.html {redirect_to admin_events_path(@ticket), notice: 'Ticket was successfully created.'}
          format.json {render :show, status: :created, location: @ticket}
        else
          format.html {render :new}
          format.json {render json: @ticket.errors, status: :unprocessable_entity}
        end
      end
    end

    # PATCH/PUT /tickets/1
    # PATCH/PUT /tickets/1.json
    def update
      respond_to do |format|
        if @ticket.update(ticket_params)
          format.html {redirect_to @ticket, notice: 'Ticket was successfully updated.'}
          format.json {render :show, status: :ok, location: @ticket}
        else
          format.html {render :edit}
          format.json {render json: @ticket.errors, status: :unprocessable_entity}
        end
      end
    end

    # DELETE /tickets/1
    # DELETE /tickets/1.json
    def destroy
      @ticket.destroy
      respond_to do |format|
        format.html {redirect_to tickets_url, notice: 'Ticket was successfully destroyed.'}
        format.json {head :no_content}
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = current_user.tickets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:user_id, :event_id, :name, :address, :price, :email_address)
    end
  end
end
