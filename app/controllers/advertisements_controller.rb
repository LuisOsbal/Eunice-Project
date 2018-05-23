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

  def new
  end

  def create
    advertisement = Advertisement.new(needed_params)
    advertisement.user_id = current_user.id
    advertisement.save
    redirect_to advertisements_path
  end

  private

  # This method initialize the service
  # This service has an attribute called params that it will filed with the
  # params that the controller send
  def advertisement_service(hash_params)
    @advertisement_service ||= AdvertisementService.new(hash_params)
  end

  def needed_params
    params.require(:advertisement).permit(
      :title,
      :content,
      :price,
      :dwelling_type,
      :postal_code,
      :street,
      :exterior_number,
      :interior_number,
      :colony,
      :municipality,
      :city,
      :state,
      :country
    )
  end
end
