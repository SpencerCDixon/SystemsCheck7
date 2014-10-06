require 'rails_helper'

feature "user can create a manufacturer" do
  scenario 'user can fill in form to create manufacturer' do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_manufacturer_path

    fill_in('Name', with: manufacturer.name)
    fill_in('Country', with: manufacturer.country)
    click_on 'Create Manufacturer'

    expect(page).to have_content("Successfully created a new manufacturer")
  end

  scenario 'user fills incorrect data to create manufacturer' do
    visit new_manufacturer_path
    click_on "Create Manufacturer"

    expect(page).to have_content('prohibited this manufacturer from being saved')
  end
end
