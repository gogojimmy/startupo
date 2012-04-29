require 'spec_helper'

describe ResourceCooperateWayShip do
  it { should belong_to(:resource) }
  it { should belong_to(:cooperate_way) }
end
