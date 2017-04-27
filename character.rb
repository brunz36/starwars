class Character
  include SwapiAttribute

  def initialize(url)
    response = HTTParty.get(url)

    define_attributes(%w{name height mass eye_color birth_year gender}, response.parsed_response)
  end
end
