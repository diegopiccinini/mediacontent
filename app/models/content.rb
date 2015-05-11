class Content < ActiveRecord::Base
  belongs_to :user
  validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }
  has_attached_file :image, styles: {
    big: '600x400>',
    medium: '300x200>',
    mini: '75x50>'
  }
end
