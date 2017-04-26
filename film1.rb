class Film
  attr_reader :title, :opening_crawl

  def self.all(films_url)
    response = HTTParty.get(films_url)
    json = JSON.parse(response.body)
    @films = json["results"].map { |hash| Film.new(hash)}
  end

  def initialize(hash)
    @hash = hash

    @title = hash["title"]
    @opening_crawl = hash["opening_crawl"]
  end

  def characters
    @characters ||= @hash["characters"].map { |url| Character.new(url) }
  end
end
