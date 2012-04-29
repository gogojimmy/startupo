require 'spec_helper'

describe ResourceType do
  it { should have_many(:resources).through(:resource_type_ships) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

  it "validate_uniqueness_of name" do
    ResourceType.create!(:name => "blah", :description => "Ya")
    should validate_uniqueness_of(:name)
  end
end
