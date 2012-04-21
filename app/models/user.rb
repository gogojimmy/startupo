class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_protected :is_admin
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :id_no, :mobile, :company, :title, :address, :name
  validates_format_of :id_no, :with => /^\w[12]\d{8}$/
  validates_format_of :email,
                      :with => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
  validates_presence_of :email, :password, :name
  validates_uniqueness_of :id_no, :email

end
