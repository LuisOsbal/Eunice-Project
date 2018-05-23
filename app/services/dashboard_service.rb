# frozen_string_literal: true

# Retrieve the dashboard data to controller
class DashboardService
  def initialize(params = {})
    @params = params
  end

  def show_all
    retrieve_advertisements(user_id: @params[:user_id])
  end

  private

  # Retrieve al the advertisement by user
  def retrieve_advertisements(params)
    Advertisement.where(params)
  end
end
