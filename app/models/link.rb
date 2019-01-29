class Link < ApplicationRecord
  validates :link, :title, presence: { message: 'Cant be blank' }

  belongs_to :user      
end
