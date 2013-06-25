class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.makeKeyAndVisible

    first_controller  = FirstController.alloc.initWithNibName(nil, bundle:nil)
    second_controller = SecondController.alloc.initWithNibName(nil, bundle:nil)
    third_controller  = ThirdController.alloc.initWithNibName(nil, bundle:nil)

    controller = UITabBarController.alloc.initWithNibName(nil, bundle:nil)

    controller.viewControllers = [ first_controller, second_controller, third_controller ]

    @window.rootViewController = controller
    true
  end
end
