require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'DB table' do
    it {is_expected.to have_db_column :title }
    
  end
  describe 'Validations' do
    it {is_expected.to validate_presence_of :title }
    
  end
  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:product)).to be_valid
    end
  end
end
