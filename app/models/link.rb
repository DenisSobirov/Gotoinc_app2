class Link < ApplicationRecord
  validates :link, :title, presence: { message: 'Cant be blank' }
  validates :link, url: true
  validates_format_of :link, with: /(?:(?:http|https):\/\/)?(?:www.)?facebook.com\/(?:(?:\w)*#!\/)?(?:pages\/)?([\w\-]*)?|^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})|^(?:https?:\/\/)?(?:www\.|go\.)?twitch\.tv\/([a-z0-9_]+)($|\?)|(?:(?:http|https):\/\/)?(?:www.)?dailymotion.com\/(?:(?:\w)*#!\/)?/,
                      message: 'of video must be from resources only', multiline: true

  belongs_to :user
end
