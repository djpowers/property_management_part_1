require 'spec_helper'

describe Owner do

  let(:blanks){ [nil, ''] }

  describe 'validations' do
    it { should have_valid(:first_name).when("Dave", "Stevie Ray") }
    it { should_not have_valid(:first_name).when(:blanks) }
    it { should have_valid(:last_name).when("Smith", "Van Bree") }
    it { should_not have_valid(:last_name).when(:blanks) }
    it { should have_valid_email_format_of :email }
  end

  describe 'database' do
    it { should have_db_column(:first_name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:last_name).of_type(:string).with_options(null: false) }
    it { should have_db_column(:email).of_type(:string).with_options(null: false) }
    it { should have_db_column(:company).of_type(:string) }
  end

end
