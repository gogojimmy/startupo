require 'spec_helper'

describe "Admin Users" do
  let!(:admin) { Factory :admin }
  before do
    sign_in(admin)
  end
  context "unconfirmed users list" do
    it "I should see unconfirmed users list" do
      unconfirmed_user = Factory :user
      visit "/admin/unconfirmed_users"
      page.should have_content(I18n.t('admin.dashboard.unconfirmed_users'))
      page.should have_link(unconfirmed_user.name)
    end
  end
  context "vists unconfirmed user" do
    before do
      @unconfirmed_user = Factory :user
      visit "/admin/users/#{@unconfirmed_user.id}"
    end
    it "I should can view this user's data" do
      page.should have_content(@unconfirmed_user.name)
      page.should have_content(@unconfirmed_user.birthday.to_date)
      page.should have_content(@unconfirmed_user.company)
      page.should have_content(@unconfirmed_user.id_no)
      page.should have_content(@unconfirmed_user.title)
      page.should have_content(@unconfirmed_user.mobile)
      page.should have_content(@unconfirmed_user.address)
    end
    it "should have button to comfirm user" do
      page.should have_link(I18n.t('admin.action.confirm_user'))
      click_link I18n.t('admin.action.confirm_user')
      page.should have_content(I18n.t('admin.message.user_confirmed'))
      @unconfirmed_user.reload
      @unconfirmed_user.confirmed_by.should == admin.id
    end
  end
end
