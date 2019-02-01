class Link < ApplicationRecord
  validates :link, :title, presence: { message: 'Cant be blank' }
  validates :link, url: true

  belongs_to :user
end
