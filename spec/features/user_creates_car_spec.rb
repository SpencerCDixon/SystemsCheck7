require 'rails_helper'

feature "user can create a new car thats associated with a manufacturer" do
  scenario "user fills in form with correct data" do
    manufacturer = FactoryGirl.create(:manufacturer)
    car = FactoryGirl.build(:car)
    visit manufacturer_path(manufacturer)

    fill_in('Color', with: car.color)
    fill_in('Year', with: car.year)
    fill_in('Mileage', with: car.mileage)

    click_on 'Create Car'
    expect(page).to have_content("Successfully created a new car")
  end

  scenario "user fills incorrect data" do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit manufacturer_path(manufacturer)

    click_on 'Create Car'
    expect(page).to have_content('prohibited this car from being saved')
  end
end
