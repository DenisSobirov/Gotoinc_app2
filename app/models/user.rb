class User < ApplicationRecord

  #:confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :lockable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def inactive_message
    super && account_active?
  end

  def inactive_message
    account_active? ? super : :locked
  end
end
