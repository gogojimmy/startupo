class WelcomeController < ApplicationController

  def index
    @upcoming_events = Event.available.order('start_time desc')
  end

  def about
  end

  def about_bmca
  end

end
