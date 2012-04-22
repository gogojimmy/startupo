module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in Factory.create(:admin) # Using factory girl as an example
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = Factory.create(:user)
      sign_in user
    end
  end

  def login_company
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:company]
      user = Factory.create(:company)
      sign_in company
    end
  end
end
