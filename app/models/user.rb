#encoding: utf-8
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :resources
  has_many :resource_matcher_ships
  has_many :match_resources, :class_name => Resource,
           :through => :resource_matcher_ships
  has_many :events
  has_many :join_event_attendee_ships
  has_many :join_events, :class_name => Event,
           :through => :join_event_attendee_ships

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :id_no, :mobile, :company, :title, :address, :name,
                  :birthday, :is_admin, :confirmed_by, :industry
  validates_format_of :id_no, :with => /^\w[12]\d{8}$/
  validates_format_of :email,
                      :with => /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
  validates_presence_of :email, :name, :id_no, :company, :title, :address, :industry
  scope :unconfirmed_users, where(:confirmed_by => nil)
  scope :admins, where(:is_admin => true)
  scope :by_industry, lambda{ |type| where('industry like ?', type) }

  INDUSTRY = { "culture" => "文化創意產業", "digital" => "數位產業",
               "it" => "IT 產業", "tradition" => "傳統產業",
               "high-tech" => "高科技產業", "green" => "綠色產業",
               "helth" => "健康產業"}

  def integrety
    has_value = 0.0
    attributes = [:name, :address, :birthday, :company, :title, :mobile,
                  :email, :id_no]
    attributes.each { |attr| has_value += 1 unless self.try(attr).blank? }
    (has_value/attributes.size.to_f*100).to_i
  end

  def match_date(resource)
    ResourceMatcherShip.where(:user_id => self.id, :resource_id => resource.id).
                              first.created_at.to_date
  end

  def match_status(resource)
    ResourceMatcherShip.where(:user_id => self.id, :resource_id => resource.id).
                              first.status
  end

end
