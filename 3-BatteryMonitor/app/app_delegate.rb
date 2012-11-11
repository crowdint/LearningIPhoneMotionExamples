class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    main_view_controller = MainViewController.alloc.initWithNibName(nil, bundle:nil)
    window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    window.rootViewController = main_view_controller
    window.makeKeyAndVisible

    true
  end
end
