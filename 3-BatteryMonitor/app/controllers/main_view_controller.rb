class MainViewController < UIViewController
  def viewDidLoad
    self.view.backgroundColor = UIColor.darkGrayColor

    # Small info button
    @info_button = UIButton.buttonWithType(UIButtonTypeInfoLight)
    @info_button.frame = [[282, 409], [18, 19]]
    @info_button.addTarget(self,
        action: :show_info,
        forControlEvents: UIControlEventTouchUpInside)

    # The Level label
    @level_label                 = UILabel.alloc.initWithFrame([[26, 116], [269, 96]])
    @level_label.font            = UIFont.systemFontOfSize(90)
    @level_label.text            = "100%"
    @level_label.color           = UIColor.whiteColor
    @level_label.backgroundColor = UIColor.darkGrayColor

    # The label that reads "State:"
    label                 = UILabel.alloc.initWithFrame([[26, 220], [70, 28]])
    label.font            = UIFont.systemFontOfSize(25)
    label.text            = "State:"
    label.color           = UIColor.whiteColor
    label.backgroundColor = UIColor.darkGrayColor

    # The State Label
    @state_label                 = UILabel.alloc.initWithFrame([[108, 220], [118, 28]])
    @state_label.font            = UIFont.systemFontOfSize(25)
    @state_label.text            = "Unknown"
    @state_label.color           = UIColor.whiteColor
    @state_label.backgroundColor = UIColor.darkGrayColor

    self.view.addSubview(@level_label)
    self.view.addSubview(label)
    self.view.addSubview(@state_label)
    self.view.addSubview(@info_button)
  end

  def viewWillAppear(animated)
    device = UIDevice.currentDevice
    device.batteryMonitoringEnabled = App.delegate.monitor_battery

    if device.batteryMonitoringEnabled?
      NSNotificationCenter.defaultCenter.
          addObserver(self, selector: :battery_changed, name: "UIDeviceBatteryLevelDidChangeNotification", object: nil)
      NSNotificationCenter.defaultCenter.
          addObserver(self, selector: :battery_changed, name: "UIDeviceBatteryStateDidChangeNotification", object: nil)
    else
      NSNotificationCenter.defaultCenter.
          removeObserver(self, name: "UIDeviceBatteryLevelDidChangeNotification", object: nil)
      NSNotificationCenter.defaultCenter.
          removeObserver(self, name: "UIDeviceBatteryStateDidChangeNotification", object: nil)
    end

    @level_label.text = self.battery_level
    @state_label.text = self.battery_state(device.batteryState)

    super
  end

  # Target Action for the info button
  def show_info
    controller = FlipsideViewController.alloc.initWithNibName(nil, bundle:nil)
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
    self.presentViewController(controller, animated: true, completion: nil)
  end

  def flipside_view_controller_did_finish(controller)
    self.dismissViewControllerAnimated(true, completion:nil)
  end

  def battery_changed
    device = UIDevice.currentDevice
    @level_label.text = self.battery_level
    @state_label.text = self.battery_state(device.batteryState)
  end

  def battery_level
    device = UIDevice.currentDevice
    level = device.batteryLevel

    if level == -1
      "---%"
    else
      percent = (100 * level)
      "%d%" % percent
    end
  end

  def battery_state(battery_state)
    case battery_state
    when UIDeviceBatteryStateUnknown
      "Unknown"
    when UIDeviceBatteryStateUnplugged
      "Unplugged"
    when UIDeviceBatteryStateCharging
      "Charging"
    when UIDeviceBatteryStateFull
      "Full"
    else
      "Undefined"
    end
  end
end
