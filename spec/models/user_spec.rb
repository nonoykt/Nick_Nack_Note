require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validated User' do
    it 'has a valid factory' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end
  end
  # <--username-->
  describe 'username' do
    it 'is invalid without an username' do
      user = FactoryBot.build(:user, username: nil)
      user.valid?
      expect(user).not_to be_valid
    end

    it '33 characters' do
      user = FactoryBot.build(:user, username: "#{'a' * 33}")
      expect(user).not_to be_valid
    end

    it '32 characters' do
      user = FactoryBot.build(:user, username: "#{'a' * 32}")
      expect(user).to be_valid
    end
  end

  # <--email-->
  describe 'email' do
    it 'is invalid without an email' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user).not_to be_valid
    end

    context '256 characters' do
      it 'is too long' do
        user = FactoryBot.build(:user, email: "#{'a' * 244 + '@example.com'}")
        expect(user).not_to be_valid
      end
    end

    context '255 characters' do
      it 'is not too long' do
        user = FactoryBot.build(:user, email: "#{'a' * 243 + '@example.com'}")
        expect(user).to be_valid
      end
    end

  end

  # <--password-->
  describe 'password' do
    it 'is invalid without a password' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user).to be_invalid
    end

    context '5 characters' do
      it 'is too short' do
        user = FactoryBot.build(:user, password: "12345")
        expect(user).not_to be_valid
      end
    end
  end
end
