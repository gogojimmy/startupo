class Admin::DashboardsController < ApplicationController
  layout "admin"
  before_filter :authenticate_admin!

  def index
    @unconfirmed_users = User.unconfirmed_users.limit(10)
  end
end
