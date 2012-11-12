class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    window.makeKeyAndVisible

    controller = FirstController.alloc.initWithNibName(nil, bundle:nil)
    window.rootViewController = controller
    true
  end
end
