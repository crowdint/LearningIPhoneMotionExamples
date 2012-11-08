describe CityController do
  before do
    @city = City.build_test_data.first
    controller.initWithCity(@city)
  end

  tests CityController

  it "Displays the city description" do
    views(UITextView).first.text.should.equal @city.description
  end

  it "Displays the city picture" do
    views(UIImageView).first.image.should.equal @city.picture
  end
end
