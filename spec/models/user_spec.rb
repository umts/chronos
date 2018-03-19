require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create :user
  end

  it 'works' do
    expect(@user.first_name).to be('Test')
  end
end