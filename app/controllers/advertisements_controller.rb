# frozen_string_literal: true

class AdvertisementsController < ApplicationController
  def index
    @advertisements = advertisement_service(user_id: current_user.id).show_all
  end

  def show
    @advertisement = advertisement_service(
      status: true,
      advertisement_id: params[:id]
    ).show
  end

  private

  # This method initialize the service
  # This service has an attribute called params that it will filed with the
  # params that the controller send
  def advertisement_service(hash_params)
    @advertisement_service ||= AdvertisementService.new(hash_params)
  end
end
