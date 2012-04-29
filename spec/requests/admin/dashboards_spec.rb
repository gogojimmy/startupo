require 'spec_helper'

def sign_in(user = nil)
  user ||= Factory :user
  visit "/signin"
  fill_in 'user_email', :with => user.email
  fill_in 'user_password', :with => user.password
  click_button I18n.t('user.devise.sign_in')
  user
end

describe "When I visit Admin Dashboard" do
  let(:user) { Factory :user }
  let(:admin) { Factory :admin }
  context "with role with" do
    it "normal user should failed" do
      sign_in(user)
      visit "/admin/dashboard"
      page.should have_content(I18n.t('error.you_are_not_admin'))
    end
    it "admin role should success" do
      sign_in(admin)
      visit "/admin/dashboard"
      page.should have_content(I18n.t('admin.dashboard.unconfirmed_users'))
      page.should have_content(I18n.t('admin.dashboard.unhandled_requests'))
    end
  end
  context "then I should see the board" do
    it "with count for unconfirmed users" do
      10.times { Factory :user }
      sign_in(admin)
      visit "/admin/dashboard"
      page.has_selector?('span.unconfirmed_users_count').should be_true
      page.should have_content('10')
    end
  end
end
