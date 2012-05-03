require 'spec_helper'

describe Resource do
  it { should have_many(:resource_types).through(:resource_type_ships) }
  it { should have_many(:resource_type_ships) }
  it { should belong_to(:user) }
  it { should have_many(:cooperate_ways).
                through(:resource_cooperate_way_ships) }
  it { should have_many(:resource_cooperate_way_ships) }
  it { should have_many(:resource_admin_category_ships) }
  it { should have_many(:admin_categories).
                through(:resource_admin_category_ships) }
  it { should ensure_inclusion_of(:state).in_range(Resource::STATE) }
end
