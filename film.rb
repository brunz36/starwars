class Film
  include SwapiAttribute

  def self.all(films_url)
    response = HTTParty.get(films_url)
    json = response.parsed_response
    json["results"].map { |hash| Film.new(hash)}
  end

  def initialize(details)
    @details = details

    define_attributes(%w{title opening_crawl}, details)
  end

  def characters
    @characters ||= @details["characters"].map { |url| Character.new(url) }
  end
end
