require 'spec_helper'

feature 'associate records owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

  # Acceptance Criteria:

  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'create owner with valid attributes' do
    visit new_owner_path
    fill_in 'First name', with: 'Butters'
    fill_in 'Last name', with: 'Stotch'
    fill_in 'Email', with: 'bstotch@propertygroup.com'
    fill_in 'Company', with: 'Property Plus'
    click_button 'Create Owner'

    expect(page).to have_content 'Owner was successfully recorded.'
  end

  scenario 'fail to create owner and show errors with invalid attributes' do
    visit new_owner_path
    click_button 'Create Owner'

    within '.input.owner_first_name' do
      expect(page).to have_content("can't be blank")
    end

    within '.input.owner_last_name' do
      expect(page).to have_content("can't be blank")
    end

    within '.input.email' do
      expect(page).to have_content("does not appear to be valid")
    end

  end

end
