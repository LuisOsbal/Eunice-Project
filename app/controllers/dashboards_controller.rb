# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    obj = dashboard_service(user_id: current_user.id).show_all
    @total_adds = obj.count
  end

  private

  # This method initialize the service
  # This service has an attribute called params that it will filed with the
  # params that the controller send
  def dashboard_service(hash_params)
    @dashboard_service ||= DashboardService.new(hash_params)
  end
end
