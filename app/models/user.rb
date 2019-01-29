class User < ApplicationRecord

  #:confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :lockable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :links
  has_one :address
  has_many :professions
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :professions
end
