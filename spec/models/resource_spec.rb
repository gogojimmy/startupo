require 'spec_helper'

describe Resource do
  it { should have_many(:resource_types).through(:resource_type_ships) }
  it { should belong_to(:user) }
end
