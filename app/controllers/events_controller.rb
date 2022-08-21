class EventsController < ApplicationController

  before_action :require_login, only: [:new, :create]

  def index
    @events = Event.all
    @users = User.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def require_login
    unless user_signed_in?
      flash[:error] = 'You must be logged in to do that.'
      redirect_to root_path
    end
  end

  def event_params
    params.require(:event).permit(:event_date, :event_name, :creator)
  end

end
