require 'rails_helper'

RSpec.describe "links", type: :request do
    it "redirects to the original URL for a given short URL link " do
      url = "https://www.uefa.com/uefachampionsleague/match/2032607--galatasaray-vs-psv/"
      shortener = Shortener.new(url)
      link = shortener.generate_short_link
      
      get link.shortened_url

      expect(response).to redirect_to(link.original_url)
    end
end