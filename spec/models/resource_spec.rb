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
  it { should have_many(:comments) }

  it "should create comment after resource created" do
    user = Factory :user
    expect { user.resources.create!(:privacy => 'public', :title => 'blah',
                                    :contact => 'user', :phone => '123',
                                    :emal => 'user@example.com',
                                    :description => 'blah',
                                    :resource_types => ResourceType.first,
                                    :cooperate_ways => CooperateWay.first) }.to
                                    change { Comment.count }.by(1)
  end

  it "should create comment after resource updated" do
    user = Factory :user
    resource = Factory :resource, :user => user
    expect { resource.update_comment(user) }.to change { Comment.count }.by(1)
  end
end
