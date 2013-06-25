class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    controller = HelloWorldController.alloc.initWithNibName(nil, bundle:nil)

    @window.rootViewController = controller
    @window.makeKeyAndVisible

    true
  end
end
