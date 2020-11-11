require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "User has db columns" do
    it { is_expected.to have_db_column :body }
    
  end

end
