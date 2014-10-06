class ManufacturersController < ApplicationController

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      flash[:notice] = "Successfully created a new manufacturer"
      redirect_to manufacturers_path
    else
      render 'new'
    end
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def index
    @manufacturers = Manufacturer.all
  end

  private

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end
end
