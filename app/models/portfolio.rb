class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # create a custom scope method for all angular subtitles
  def self.angular
    where(subtitle: 'Angular')
  end
  # another way to create a custom scope method
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= 'http://placehold.it/600x400'
    self.thumb_image ||= 'http://placehold.it/350x200'
  end
end
