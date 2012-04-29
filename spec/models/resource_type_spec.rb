require 'spec_helper'

describe ResourceType do
  it { should have_many(:resources).through(:resource_type_ships) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
