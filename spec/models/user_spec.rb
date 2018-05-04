require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create :user
  end

  describe '#full_name' do
    it 'returns users full name' do
      expect(@user.full_name).to eq('Test User')
    end
  end

  describe '#union' do
    it 'returns the users union' do
      expect(@user.union.name).to eq('Test Union')
    end
  end

  describe '#supervisor_of?' do
    it 'returns true if user is subordinate of given supervisor' do
      user2 = create(:user, supervisor: @user)
      expect(@user.supervisor_of?(user2)).to be(true)
    end
    it 'returns false if user is not a subordinate of given supervisor' do
      user2 = create(:user)
      expect(@user.supervisor_of?(user2)).to be(false)
    end
  end

  describe '#subordinate_of?' do
    it 'returns true if this user is a supervisor of given user' do
      user2 = create(:user, supervisor: @user)
      expect(user2.subordinate_of?(@user)).to be(true)
    end
    it 'returns false if this user is not a supervisor of given user' do
      user2 = create(:user)
      expect(user2.subordinate_of?(@user)).to be(false)
    end
  end
end