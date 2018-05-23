# frozen_string_literal: true

class AdvertisementService
  def initialize(params = {})
    @params = params
  end

  def show_all
    retrieve_advertisements(user_id: @params[:user_id])
  end

  def show
    retrieve_advertisements(
      status: @params[:status],
      id: @params[:advertisement_id]
    )
  end

  private

  # Retrieve al the advertisement by user
  def retrieve_advertisements(params)
    Advertisement.where(params)
  end
end
