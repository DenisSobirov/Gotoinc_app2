class Link < ApplicationRecord
  validates :link, :title, presence: { message: 'Cant be blank' }
  validates_format_of :link, with: /^(?:https?:\/\/)?(?:www\.)?(m.)?youtu(?:\.be|be\.com)\/(?:watch\?)?(([\w-]{10,})|(v=[\w-]{10,}))/, message: 'of video must be from resources only', multiline: true

  belongs_to :user
end


# /(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?([\w\-]*)?|^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})|^(?:https?:\/\/)?(?:www\.|go\.)?twitch\.tv\/([a-z0-9_]+)($|\?)|(?:(?:http|https):\/\/)?(?:www.)?dailymotion.com\/(?:(?:\w)*#!\/)?/
