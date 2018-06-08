class Portfolio < ApplicationRecord
  has_many :technologies
  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                 reject_if: lambda { |attrs| attrs['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  # create a custom scope method for all angular subtitles
  def self.angular
    where(subtitle: 'Angular')
  end
  # another way to create a custom scope method
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  def self.by_position
    order("position ASC")
  end
end
