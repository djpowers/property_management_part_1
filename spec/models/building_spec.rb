require 'spec_helper'

describe Building do

  let(:blanks){ [nil, ''] }

  describe 'validations' do
    it { should have_valid(:address).when('123 Main St.', '321 Manchester Boulevard') }
    it { should_not have_valid(:address).when(*blanks) }

    it { should have_valid(:city).when('Boston', 'New Brunswick') }
    it { should_not have_valid(:city).when(*blanks) }

    it { should have_valid(:state).when('MA', 'CT') }
    it { should_not have_valid(:state).when('Massachusetts', 'Connecticut') }
    it { should_not have_valid(:state).when(*blanks) }

    it { should have_valid(:postal_code).when('02116') }
    it { should_not have_valid(:postal_code).when('123456') }
    it { should_not have_valid(:postal_code).when(*blanks) }
  end

  describe 'associations' do
    it { should belong_to :owner }
  end

  describe 'database' do
    it { should have_db_column(:address).of_type(:string).with_options(null: false) }
    it { should have_db_column(:city).of_type(:string).with_options(null: false) }
    it { should have_db_column(:state).of_type(:string).with_options(null: false) }
    it { should have_db_column(:postal_code).of_type(:string).with_options(null: false) }
    it { should have_db_column(:description).of_type(:text) }
    it { should have_db_column(:owner_id).of_type(:integer) }
  end

end
