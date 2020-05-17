require 'rails_helper'

RSpec.describe Micropost, type: :model do
  describe 'Valited Micropost' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:micropost)).to be_valid
    end
  end

  describe '141 characters' do
    it 'is too long' do
      user = FactoryBot.build(:user)
      micropost = user.microposts.create(
        content: "#{'a' * 141}",
        user: user
      )
      expect(micropost).not_to be_valid
    end
  end
end
