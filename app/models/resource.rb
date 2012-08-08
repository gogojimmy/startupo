#encoding: UTF-8
class Resource < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignee, :class_name => User, :foreign_key => :assign_to
  has_many :resource_matcher_ships
  has_many :matchers, :class_name => User, :through => :resource_matcher_ships
  has_many :resource_type_ships
  has_many :resource_types, :through => :resource_type_ships
  has_many :resource_cooperate_way_ships
  has_many :cooperate_ways, :through => :resource_cooperate_way_ships
  has_many :resource_admin_category_ships
  has_many :admin_categories, :through => :resource_admin_category_ships
  has_many :comments

  scope :public_resources, where(:to_public => true)
  scope :private_resources, where(:to_public => false)
  scope :by_state, lambda{ |state| where(:state => state) }
  scope :by_contract, lambda{ |contract| where(:contract_state => contract) }
  scope :unapproved, where(:assign_to => nil)
  scope :my_responsibility, lambda{ |user| where(:assign_to => user) }
  scope :by_user_id, lambda{ |user_id| where(:user_id => user_id) }
  default_scope :order => 'created_at DESC'

  PRIVACY = { "public" => "公開", "private" => "隱藏" }
  STATE = { "pending" => "未處理", "proccessing" => "處理中",
            "denied" => "已拒絕", "done" => "已結案" }
  CONTRACT_STATE = { "prepared" => "合約擬定", "stamp" => "合約用印",
                     "stopped" => "合約停止", "uncontract" => "待努力"}

  validates_inclusion_of :privacy, :in => PRIVACY.keys
  validates_inclusion_of :state, :in => STATE.keys
  validates_inclusion_of :contract_state, :in => CONTRACT_STATE.keys
  validates_presence_of :title, :contact, :phone, :email, :description,
                        :resource_types, :cooperate_ways
  validate :have_or_find_resources
  before_validation :set_state

  def update_comment(user)
    self.changes.each do |attr, value|
      self.comments.create(:user => user,
                           :content => I18n.t('comment.update_message',
                                              :user => user.name,
                                              :attr => I18n.t("resource.attributes.#{attr}"),
                                              :from => value[0],
                                              :to => value[1]))
    end
  end

  def self.by_type(type)
    case type
    when "fund"
      type = "資金"
    when "team"
      type = "團隊"
    when "supplier"
      type = "供應商"
    when "tech"
      type = "製造技術"
    when "access"
      type = "相關通路"
    when "strategy"
      type = "策略聯盟"
    when "contacts"
      type = "人脈資源"
    when "activity"
      type = "活動配合"
    end
    Resource.joins(:resource_types).where(:resource_types => {:name => type})
  end

  def self.by_category(category)
    Resource.joins(:admin_categories).where(:admin_categories => {:name => category})
  end

  def self.by_cooperate_way(way)
    Resource.joins(:coorperate_ways).where(:coorperate_ways => {:name => way})
  end

  def types
    self.resource_types.map(&:name)
  end

  def ways
    self.cooperate_ways.map(&:name)
  end

  def categories
    self.admin_categories.map(&:name)
  end

  def i_want_it(user)
    ResourceMatcherShip.create!(:user_id => user.id, :resource_id => self.id)
  end

  def update_match_status(user_id, status)
    match_ship = self.resource_matcher_ships.where(:user_id => user_id).first

    case status
    when 'deny'
      match_ship.destroy
    else
      match_ship.update_attribute(:status, status)
    end
  end

  def send_interest_mail(user)
    ResourceMailer.somebody_interest_it(user, self).deliver
  end

  protected

  def have_or_find_resources
    self.have_resource || self.find_resource
  end

  def set_state
    if !self.state.present?
      self.state = "pending"
    end
    if !self.contract_state.present?
      self.contract_state = "uncontract"
    end
  end
end
