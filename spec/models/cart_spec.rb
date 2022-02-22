RSpec.describe Cart, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many :products }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(create(:cart)).to be_valid
    end
  end
end
