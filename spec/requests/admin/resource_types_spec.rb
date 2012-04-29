require 'spec_helper'

describe "Admin resource type actions" do
  let(:admin) { Factory :admin }
  before do
    sign_in(admin)
  end
  describe "Create resource type" do
    it "should be success" do
      visit "admin/resource_types/new"
      fill_in('resource_type_name', :with => 'Type A')
      fill_in('resource_type_description', :with => 'Type A description')
      click_button(:submit)
      page.should have_content(I18n.t('action.create_successful'))
      type = ResourceType.last
      type.name.should == 'Type A'
      type.description.should == 'Type A description'
    end
  end
  describe "Update resource type" do
    let(:type) { Factory :resource_type }
    it "should be success" do
      visit "admin/resource_types/#{type.id}/edit"
      fill_in('resource_type_name', :with => 'Type A')
      fill_in('resource_type_description', :with => 'Type A description')
      click_button(:submit)
      page.should have_content(I18n.t('action.update_successful'))
      type = ResourceType.last
      type.name.should == 'Type A'
      type.description.should == 'Type A description'
    end
  end
  describe "Show resource type" do
    let(:type) { Factory :resource_type }
    it "should be success" do
      visit "admin/resource_types/#{type.id}"
      page.should have_content(type.name)
      page.should have_content(type.description)
    end
  end
  describe "Show resource types index" do
    before do
      @types =[]
      2.times do
        @types << (Factory :resource_type)
      end
    end
    it "should see types" do
      visit "admin/resource_types"
      page.should have_link(@types[0].name)
      page.should have_content(@types[0].description)
      page.should have_link(@types[1].name)
      page.should have_content(@types[1].description)
    end
  end
  describe "Delete resource type" do
    before do
      Factory :resource_type
    end
    it "should success" do
      visit "admin/resource_types"
      click_link(I18n.t('action.delete'))
      page.should have_content(I18n.t('action.destroy_successful'))
      ResourceType.count.should == 0
    end
  end
end
