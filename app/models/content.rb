class Content < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history, :finders]

  belongs_to :user
  validates :image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }
  has_attached_file :image, styles: {
    big: '600x400>',
    medium: '300x200>',
    mini: '75x50>'
  }
  validates :name, presence: true
  validates :content_type, inclusion: { in: %w(image video link),
    message: "%{value} is not a valid type" }
  def to_param
    self.slug
  end
end
