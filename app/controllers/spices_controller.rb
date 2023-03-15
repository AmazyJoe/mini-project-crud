class SpicesController < ApplicationController
  wrap_parameters format: []

  def index  
    spices = Spice.all
    render json: spices
  end

  def create
    spice = Spice.create(spice_params)
    render json: spice, status: :created
  end

  def update
    spice = Spice.find(params[:id])
    if spice
      spice.update(spice_params)
      render json: spice, status: :accepted
    else
      render json: {error: "spice not found"}, status: :not_found
    end
  end

  def destroy
    spice = Spice.find(params[:id])
    if spice
      spice.destroy
    else
      render json: {error: "spice not found"}, status: :not_found
    end
  end

  def spice_params
    params.permit(:title, :image, :description, :notes, :rating)
  end
end

