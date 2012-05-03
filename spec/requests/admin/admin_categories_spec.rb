require 'spec_helper'

describe Admin::AdminCategoriesController do
  let(:admin) { Factroy :user_profile }
  before do
    sign_in(admin)
  end

  describe "Create category" do
    it "should success" do
      visit "/admin/admin_categories/new"
      fill_in(I18n.t('admin.attributes.name'), :with => "something")
      fill_in(I18n.t('admin.attributes.description'), :with => "something")
      click_link(:submit)
      page.should have_content(I18n.t('action.create_successful'))
      category = AdminCategory.last
      category.name.should == "something"
      category.description.should == "something"
    end
  end
  describe "Update category" do
    it "should success" do
      category = Factory :admin_category
      visit "/admin/admin_categories/#{category.id}"
      fill_in(I18n.t('admin.attributes.name'), :with => "something")
      fill_in(I18n.t('admin.attributes.description'), :with => "something")
      click_link(:submit)
      page.should have_content(I18n.t('action.update_successful'))
      category.reload
      category.name.should == "something"
      category.description.should == "something"
    end
  end
  describe "Destroy category" do
    it "should success" do
      category = Factory :admin_category
      visit "/admin/admin_categories"
      click_link(I18n.t('action.delete'))
      page.should have_content(I18n.t('action.delete_successful'))
      AdminCategory.count.should == 0
    end
  end
end
