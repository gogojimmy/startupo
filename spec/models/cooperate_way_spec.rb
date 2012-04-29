require 'spec_helper'

describe CooperateWay do
  it { should have_many(:resource_cooperate_way_ships) }
  it { should have_many(:resources).through(:resource_cooperate_way_ships) }
end
