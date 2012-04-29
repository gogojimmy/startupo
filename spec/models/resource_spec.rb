require 'spec_helper'

describe Resource do
  it { should have_many(:resource_types).through(:resource_type_ships) }
  it { should have_many(:resource_type_ships) }
  it { should belong_to(:user) }
  it { should have_many(:cooperate_ways).through(:resource_cooperate_way_ships) }
  it { should have_many(:resource_cooperate_way_ships) }
end
