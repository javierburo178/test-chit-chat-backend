require 'digest/sha2'

class Shortener

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def generate_short_link
    Link.create(original_url: url, short_url: generate_short_url)
  end

  def generate_short_url
    i = 0 
    loop do
      new_url = generate_algorithm(i)
      break new_url unless Link.exists?(short_url:new_url)
      i = i + 1
    end
  end

  private

  def generate_algorithm(i)
    Digest::SHA256.hexdigest(url)[i..(i+6)]
  end

end