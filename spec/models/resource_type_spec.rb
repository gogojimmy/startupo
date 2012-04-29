require 'spec_helper'

describe ResourceType do
  it { should have_many(:resources).through(:resource_type_ships) }
end
