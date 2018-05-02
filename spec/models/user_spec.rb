require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create :user
  end

  describe 'full_name' do
    it 'returns users full name' do
      expect(@user.full_name).to eq('Test User')
    end
  end

  describe 'union' do
    it 'returns the users union' do
      expect(@user.union.name).to eq('Test Union')
    end
  end
end