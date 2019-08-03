class EventsController < ApplicationController
  before_action :check_status

  def index
      @user = User.find(session[:user_id])
    #   @events = Event.all
      @events = Event.where.not(state:User.find(session[:user_id]).state).all
      @events_attend = User.find(session[:user_id]).events_attending
      @eventfar = Event.where(state:User.find(session[:user_id]).state).all
  end

  def create
    user = User.find(session[:user_id])
    event = Event.create(name: params[:name], city: params[:city], state: params[:state], date: params[:date], user:user)
    if !event.valid?
        flash[:errors] = event.errors.full_messages.to_sentence
        # render json: user.errors
        # redirect_to ('/show/' + user.id.to_s)
        redirect_to '/events'
    end
    redirect_to '/events'
  end


  def show
  end

  def check_status
      if !session[:user_id]
          redirect_to '/'
      end
  end
end
