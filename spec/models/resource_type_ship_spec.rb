require 'spec_helper'

describe ResourceTypeShip do
  it { should belong_to(:resource) }
  it { should belong_to(:resource_type) }
end
