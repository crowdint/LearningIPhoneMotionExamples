describe AddNewCityController do
  before do
    App.delegate.cities                     = []
    nav_controller                          = UINavigationController.alloc.initWithNibName(nil, bundle: nil)
    window.rootViewController               = nav_controller
    nav_controller.viewControllers          = [ controller ]
    App.delegate.root_controller            = RootController.alloc.init
    App.delegate.root_controller.table_view = UITableView.alloc.init
  end

  tests AddNewCityController

  describe "Save Item" do
    it "creates the new city" do
      views(UITextView)[0].text = "Test City Name"
      views(UITextView)[1].text = "Test City Description"

      controller.save_city(nil)

      App.delegate.cities.count.should.equal 1
      city = App.delegate.cities.first
      city.name.should.equal "Test City Name"
      city.description.should.equal "Test City Description"
    end
  end
end
