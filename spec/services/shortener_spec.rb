require "rails_helper"

RSpec.describe Shortener do

  it "shortens a given URL to a 7 character lookup code" do
    original_url = "https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres"
    short_url = Shortener.new(original_url)
    expect(short_url.generate_short_url.size).to eq(7)
  end

  it "gives each url its own short_url" do
    original_url = "https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres"
    short_url = Shortener.new(original_url)
    new_url = short_url.generate_short_url

    original_url = "https://www.digitalocean.com/community/questions/hosting-website-on-ubuntu-20-4-droplet"
    short_url = Shortener.new(original_url)
    new_url_2 = short_url.generate_short_url

    expect(new_url).not_to eq(new_url_2)

  end

  it "always give the same URL the same short url generated" do
    original_url = "https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres"
    short_url = Shortener.new(original_url)
    new_url = short_url.generate_short_url

    original_url = "https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres"
    short_url = Shortener.new(original_url)
    second_url = short_url.generate_short_url

    expect(new_url).to eq(second_url)
  end

  it "will generates a Link record with a unique short url" do

    url = "https://www.digitalocean.com/community/tutorials/how-to-set-up-ruby-on-rails-with-postgres"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link

    expect(link.valid?).to be(true)
  end

end