require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User has db columns" do
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
  end

  describe "Factory" do
    it "Should have valid factory" do
      expect(create(:user)).to be_valid
    end
  end
end
