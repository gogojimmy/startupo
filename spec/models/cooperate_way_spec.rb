require 'spec_helper'

describe CooperateWay do
  it { should have_many(:resource_cooperate_way_ships) }
  it { should have_many(:resources).through(:resource_cooperate_way_ships) }

  it "should validate_uniqueness_of name" do
    CooperateWay.create!(:name => "blah", :description => "blah")
    should validate_uniqueness_of(:name)
  end
end
