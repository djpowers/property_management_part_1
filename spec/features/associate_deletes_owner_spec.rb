require 'spec_helper'

feature 'associate deletes owner', %Q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

  # Acceptance Criteria:

  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'delete an owner' do
    building = FactoryGirl.create(:building_with_owner)
    expect(building.owner).to be_present

    visit owners_path
    click_on 'Destroy'

    expect(building.reload.owner).to be_nil
    expect(page).to have_content('Owner was successfully deleted.')
  end

end
