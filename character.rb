class Character
  attr_reader :name, :height, :mass, :eye_color, :birth_year, :gender

  def initialize(url)
    response = HTTParty.get(url)
    details = JSON.parse(response.body)
    @name = details["name"]
    @height = details["height"]
    @mass = details["mass"]
    @eye_color = details["eye_color"]
    @birth_year = details["birth_year"]
    @gender = details["gender"]
  end
end
