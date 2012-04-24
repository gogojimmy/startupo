module Login
  def sign_in(user = nil)
    user ||= Factory :user
    visit "/signin"
    fill_in 'user_email', :with => user.email
    fill_in 'user_password', :with => user.password
    click_button I18n.t('user.devise.sign_in')
    user
  end
end
