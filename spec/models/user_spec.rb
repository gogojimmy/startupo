require 'spec_helper'

describe User do
  before do
    @user = Factory :user
  end
  it { should validate_presence_of(:name) }
  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("a@b.com").for(:email) }
  it { should_not allow_value("b.com").for(:email) }
  it { should validate_presence_of(:password) }
end
