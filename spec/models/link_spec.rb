require "rails_helper"

RSpec.describe Link do
  it "Always has an original URL and a short URL" do
    link = Link.new(
     original_url: "https://www.digitalocean.com/community",
     short_url: "1234567"
    )
    expect(link.valid?).to be(true)
  end

  it "Invalid if does not have original url" do
    link = Link.new(
    short_url: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it "Invalid if does not have short url" do
    link = Link.new(
     original_url: "https://www.digitalocean.com/community"
    )
    expect(link.valid?).to be(false)
  end

  it "Is invalid if the url is not formatted properly" do
    link = Link.new(
     original_url: "asdfddghftui",
     short_url: "1234567"
    )
    expect(link.valid?).to be(false)
  end

  it "It will be invalid if short url already exists" do
    link = Link.new(
     original_url: "https://www.digitalocean.com/community",
     short_url: "1234567"
    )
    link.save


    link_2 = Link.new(
     original_url: "https://www.digitalocean.com/community",
     short_url: "1234567"
    )
    expect(link_2.valid?).to be(false)
  end

  it "generates a Link record with unique short_url" do
    url = "https://www.digitalocean.com/community"
    shortener = Shortener.new(url)
    link = shortener.generate_short_link
    expect(link.valid?).to be(true)
    expect(link.original_url).to eq(url)
  end

end