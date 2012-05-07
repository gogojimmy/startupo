class Admin::DashboardsController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin!

  def index
    @unconfirmed_users = User.unconfirmed_users.limit(10)
    @unapproved_resources = Resource.unapproved.limit(10)
    @my_responsibility = Resource.my_responsibility(current_user).limit(10)
    @events = Event.available.limit(10)
  end
end
