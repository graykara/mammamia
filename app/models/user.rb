class User < ActiveRecord::Base
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

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

  validates :password, presence: true, length: {minimum: 6, maximum: 10}, on: :create
  validates :password, length: {minimum: 6, maximum: 10}, on: :update, allow_blank: true
end
