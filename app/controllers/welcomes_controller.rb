class WelcomesController < ApplicationController

  def index
    @upcoming_events = Event.available.order('start_time desc')
  end

  def about
  end

end
