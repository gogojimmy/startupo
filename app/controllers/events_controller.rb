class EventsController < ApplicationController
  before_filter :authenticate_user!, :only => [:join]

  def index
    @events = Event.available.opened.paginate(:page => params[:page])
  end

  def show
    @event = Event.find(params[:id])
    @title = @event.name
  end

  def join
    @event = Event.find(params[:event_id])
    @event.join(current_user)
    flash[:notice] = I18n.t('event.message.join_successful')
    EventMailer.confirm(current_user, @event.name).deliver
    redirect_to @event
  end
end
