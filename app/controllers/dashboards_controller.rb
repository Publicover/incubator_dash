class DashboardsController < ApplicationController
  before_action :logged_in_as_admin?

  def index
  end

end
