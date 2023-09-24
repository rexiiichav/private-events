class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(post_params)

    if @event.save
      redirect_to events_path(@event.id)
    else
      render 'root'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(post_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  def rsvp
    @event = Event.find(params[:id])
    if @event.attendees.include?(current_user)
      redirect_to @event, notice: "You are already on the list"
    else
      @event.attendees << current_user
      redirect_to @event
    end
  end

  def cancel_rsvp
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: "You are no longer attending this event"
  end

  def invite
    @event = Event.find(params[:id])
    @invitee = User.where("email = ?", params[:email]).first
    if @event.invitees.include?(@invitee)
      redirect_to @event, notice: "They are already on the list"
    else
      @event.invitees << @invitee
      redirect_to @event
    end
  end

  private

  def post_params
    params.require(:event).permit(:name, :date)
  end
end