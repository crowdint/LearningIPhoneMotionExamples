class AppDelegate
  attr_accessor :monitor_battery
  attr_accessor :main_view_controller

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    monitor_battery = false

    self.main_view_controller = MainViewController.alloc.initWithNibName(nil, bundle:nil)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @window.rootViewController = self.main_view_controller
    @window.makeKeyAndVisible

    true
  end
end
