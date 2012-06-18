require 'spec_helper'

describe AdminCategory do
  it { should have_many(:resource_admin_category_ships) }
  it { should have_many(:resources).
                through(:resource_admin_category_ships) }
end
