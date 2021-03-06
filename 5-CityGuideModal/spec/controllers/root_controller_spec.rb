describe RootController do
  before do
    App.delegate.cities            = City.build_test_data
    nav_controller                 = UINavigationController.alloc.initWithNibName(nil, bundle: nil)
    window.rootViewController      = nav_controller
    nav_controller.viewControllers = [ controller ]
  end

  tests RootController

  it "shows a table with the test data" do
    data = City.build_test_data

    data.each do |city|
      view(city.name).should.not.equal nil
    end
  end

  describe "Tap a city cell" do
    before do
      @city = City.build_test_data.first
      tap @city.name
    end

    it "goes to its detail view" do
      controller.navigationController.topViewController.should.not.be.same_as controller
      controller.navigationController.topViewController.should.be.instance_of(CityController)
    end
  end
end
