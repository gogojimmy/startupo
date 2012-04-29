class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :id_no, :mobile, :company, :title, :address, :name,
                  :birthday, :is_admin, :confirmed_by
  validates_format_of :id_no, :with => /^\w[12]\d{8}$/
  validates_format_of :email,
                      :with => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
  validates_presence_of :email, :name
  scope :unconfirmed_users, where(:confirmed_by => nil)

  def integrety
    has_value = 0.0
    attributes = [:name, :address, :birthday, :company, :title, :mobile,
                  :email, :id_no]
    attributes.each { |attr| has_value += 1 unless self.try(attr).blank? }
    (has_value/attributes.size.to_f*100).to_i
  end

end
