require 'spec_helper'

feature 'associate records building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

  # Acceptance Criteria:

  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'create building with valid attributes' do
    visit new_building_path
    fill_in 'Address', with: '123 Main Street'
    fill_in 'City', with: 'Boston'
    select 'Massachusetts', from: 'State'
    fill_in 'Postal code', with: '02116'
    fill_in 'Description', with: 'Very historic'
    click_button 'Create Building'

    expect(page).to have_content 'Building was successfully recorded.'
  end

  scenario 'fail to create building and show errors with invalid attributes' do
    visit new_building_path
    click_button 'Create Building'

    within '.input.building_address' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.building_city' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.building_state' do
      expect(page).to have_content "can't be blank"
    end

    within '.input.building_postal_code' do
      expect(page).to have_content "is the wrong length"
    end

  end

end
