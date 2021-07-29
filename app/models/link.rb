class Link < ApplicationRecord
  belongs_to :user
  validates :original_url, presence: true
  validates :short_url, presence: true
  validates_uniqueness_of :short_url

  validate :original_url_format
  
  def original_url_format
    uri = URI.parse(original_url || "")
    if uri.host.nil?
      errors.add(:original_url, "Invalid URL format")
    end
  end

  def shortened_url
  "http://localhost:3000/#{short_url}"
  end

 
end
