require 'spec_helper'

describe ResourceAdminCategoryShip do
  it { belong_to(:resource) }
  it { belong_to(:admin_category) }
end
