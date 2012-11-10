class AppDelegate
  attr_accessor :cities

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    return true if RUBYMOTION_ENV == 'test'

    cities = City.build_test_data

    @root_controller = RootController.alloc.initWithNibName(nil, bundle: nil)

    @nav_controller                 = UINavigationController.alloc.initWithNibName(nil, bundle:nil)
    @nav_controller.viewControllers = [@root_controller]

    @window                    = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = @nav_controller
    @window.makeKeyAndVisible

    true
  end
end
