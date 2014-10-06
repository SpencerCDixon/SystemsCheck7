class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @manufacturer = Manufacturer.find(params[:manufacturer_id])
    @car.manufacturer_id = @manufacturer.id

    if @car.save
      flash[:notice] = "Successfully created a new car"
      redirect_to manufacturer_path(@manufacturer)
    else
      @cars = @manufacturer.cars.all
      render 'manufacturers/show'
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description)
  end
end
