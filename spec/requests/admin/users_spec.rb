require 'spec_helper'

describe "Admin Users" do
  let(:admin) { Factory :admin }
  before do
    sign_in(admin)
  end
  context "unconfirmed users list" do
    it "I should see unconfirmed users list" do
      visit "/admin/unconfirmed_users"
      page.should have_content(I18n.t('admin.dashboard.unconfirmed_users'))
    end
  end
end
