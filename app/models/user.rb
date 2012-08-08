#encoding: utf-8
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :resources
  has_many :resource_matcher_ships
  has_many :match_resources, :class_name => Resource,
           :through => :resource_matcher_ships
  has_many :events
  has_many :join_event_attendee_ships
  has_many :join_events, :class_name => Event,
           :through => :join_event_attendee_ships
  has_many :posts

  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :id_no, :mobile, :company, :title, :address, :name,
                  :birthday, :is_admin, :confirmed_by, :industry, :provider,
                  :uid, :access_token
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

  validates_inclusion_of :industry, :in => INDUSTRY.keys

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.access_token = auth.credentials.token
      user.email = auth.info.email
      user.birthday = auth.info.birthday
    end
  end

  def assign_omniauth(auth)
    return false if User.where(auth.slice(:provider, :uid)).count > 0
    self.update_attributes(:provider => auth.provider,
                           :uid => auth.uid,
                           :access_token => auth.credentials.token)
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

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
