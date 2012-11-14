class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    window.makeKeyAndVisible

    controller = PrototypeViewController.alloc.initWithNibName(nil, bundle: nil)
    window.rootViewController = controller

    true
  end
end
