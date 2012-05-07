class Admin::EventsController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @event = Event.new
    2.times do
      @event.assets.build
      @event.images.build
    end
  end

  def create
    @event = current_user.events.build(params[:event])

    if @event.save
      flash[:notice] = I18n.t('action.create_successful')
      redirect_to admin_event_path(@event)
    else
      render :action => "new"
    end
  end

  def index
    if params[:available]
      @events = Event.available.paginate(:page => params[:page])
    else
      @events = Event.paginate(:page => params[:page])
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    2.times do
      @event.assets.build
      @event.images.build
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      flash[:notice] = I18n.t('action.update_successful')
      redirect_to admin_event_path(@event)
    else
      render :action => "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:warning] = I18n.t('action.destroy_successful')
    redirect_to admin_events_path
  end
end
