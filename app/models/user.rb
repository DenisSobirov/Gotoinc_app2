class User < ApplicationRecord

  #:confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :lockable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  has_many :links
  has_one :address, :dependent => :destroy
  has_many :professions, :dependent => :destroy


  accepts_nested_attributes_for :address, :allow_destroy => true
  accepts_nested_attributes_for :professions, :allow_destroy => true


  after_initialize do
   self.address ||= self.build_address
   self.professions ||= self.build_profession
  end

  def create_prof
    self.build_profession
  end
end
