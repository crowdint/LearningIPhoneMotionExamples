class FlipsideViewController < UIViewController
  def viewDidLoad
    self.view.backgroundColor = UIColor.darkGrayColor

    # Navigation Bar
    done_button                       = UIBarButtonItem.alloc.initWithTitle("Done", style: UIBarButtonItemStyleDone, target: self, action: :done)
    nav_bar                           = UINavigationBar.alloc.initWithFrame([[0, 0], [320, 44]])
    nav_bar.barStyle                  = UIBarStyleBlack
    navigation_item                   = UINavigationItem.alloc.initWithTitle "Preferences"
    navigation_item.leftBarButtonItem = done_button
    nav_bar.pushNavigationItem(navigation_item)


    # The label
    label                 = UILabel.alloc.initWithFrame([[20, 81], [180, 30]])
    label.text            = "Monitor Battery"
    label.font            = UIFont.systemFontOfSize(25)
    label.color           = UIColor.whiteColor
    label.backgroundColor = UIColor.darkGrayColor

    # The switch
    @toggle_switch    = UISwitch.alloc.initWithFrame([[223, 82], [79, 27]])
    @toggle_switch.on = App.delegate.monitor_battery
    @toggle_switch.accessibilityLabel = 'monitor switch'

    self.view.addSubview(label)
    self.view.addSubview(nav_bar)
    self.view.addSubview(@toggle_switch)
  end

  # Target Action for the Done button on the Navigation Bar
  def done
    p @toggle_switch.on?
    App.delegate.monitor_battery = @toggle_switch.on?
    App.delegate.main_view_controller.flipside_view_controller_did_finish(self)
  end
end
