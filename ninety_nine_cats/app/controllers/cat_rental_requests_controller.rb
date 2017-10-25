class CatRentalRequestsController < ApplicationController
  def new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.create(cat_rental_request_params)
    if @cat_rental_request
      render json: @cat_rental_request
    else
      render json: @cat_rental_request.errors.full_messages
    end
  end

  def approve
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.approve!
    redirect_to cat_url(@cat_rental_request.cat_id)
  end

  def deny
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.deny!
  end

  private

  def cat_rental_request_params
    params[:cat_rental_request].permit(:cat_id, :start_date, :end_date)
  end
end
