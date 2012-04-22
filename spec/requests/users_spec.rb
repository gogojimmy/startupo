require 'spec_helper'

describe "Users" do
  context "when I go to sign up page" do
    it "should sign up successfully" do
      visit "/users/sign_up"
      fill_in 'user_email', :with => 'user@example.com'
      fill_in 'user_name', :with => 'example'
      fill_in 'user_password', :with => 'password'
      fill_in 'user_password_confirmation', :with => 'password'
      fill_in 'user_id_no', :with => 'A127421684'
      fill_in 'user_mobile', :with => '0975519929'
      click_button I18n.t('user.devise.sign_up')
      page.should have_content(I18n.t('devise.registrations.signed_up'))
      page.should have_content("Hi! example")
      User.last.email.should == 'user@example.com'
    end
  end
  context "Sign in or Sign out" do
    let(:user) { Factory :user }
    it "should sign in successfully" do
      visit "/signin"
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button I18n.t('user.devise.sign_in')
      page.should have_content(I18n.t('devise.sessions.signed_in'))
      page.should have_content("Hi! #{user.name}")
      click_link I18n.t('user.devise.sign_out')
      page.should have_content(I18n.t('devise.sessions.signed_out'))
    end
  end
end
