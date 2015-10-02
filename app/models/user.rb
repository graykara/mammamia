class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  default_scope { order(created_at: :desc) }

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :partner_detail
  belongs_to :contract

  accepts_nested_attributes_for :partner_detail

  validates :password, presence: true, length: {minimum: 6, maximum: 12}, on: :create
  validates :password, length: {minimum: 6, maximum: 12}, on: :update, allow_blank: true

  def self.search_by_category(query, category)
    if category == 'name'
      where('name LIKE ?', "%#{query}%")
    elsif category == 'cell'
      joins(:partner_detail).where('partner_details.biz_cell LIKE ? OR partner_details.biz_cell LIKE ?', "%#{query}%", "%#{query}%")
    elsif category == 'corp_name'
      joins(:partner_detail).where('partner_details.corp_name LIKE ?', "%#{query}%")
    elsif category == 'all'
      joins(hospital_user: :partner_detail).where('partner_details.corp_name LIKE ?', "%#{query}%").joins(studio_users: :partner_detail).where('partner_details.corp_name LIKE ?', "%#{query}%")
    end
  end
end
