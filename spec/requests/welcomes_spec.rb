#encoding: UTF-8
require 'spec_helper'

describe "Welcomes" do
  describe "GET /" do
    it "see 歡迎來到史塔波" do
      visit "/"
      page.should have_content('歡迎來到史塔波')
    end
    it "see Signup button" do
      visit "/"
      page.should have_link('加入史塔波')
    end
  end
end
