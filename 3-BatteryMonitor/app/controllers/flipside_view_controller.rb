class FlipsideViewController < UIViewController
  def viewDidLoad
    self.view.backgroundColor = UIColor.darkGrayColor
    self.title = "Preferences"

    # Navigation Bar
    done_button = UIBarButtonItem.alloc.initWithTitle("Done", style: UIBarButtonItemStyleDone, target: self, action: :done)
    nav_bar = UINavigationBar.alloc.initWithFrame([[0, 0], [320, 44]])
    nav_bar.barStyle = UIBarStyleBlack
    navigation_item = UINavigationItem.alloc.initWithTitle "Preferences"
    navigation_item.leftBarButtonItem = done_button
    nav_bar.pushNavigationItem(navigation_item)


    # The label
    label                 = UILabel.alloc.initWithFrame([[20, 81], [180, 30]])
    label.text            = "Monitor Battery"
    label.font            = UIFont.systemFontOfSize(25)
    label.color           = UIColor.whiteColor
    label.backgroundColor = UIColor.darkGrayColor

    # The switch
    toggle_switch = UISwitch.alloc.initWithFrame([[223, 82], [79, 27]])

    self.view.addSubview(label)
    self.view.addSubview(nav_bar)
    self.view.addSubview(toggle_switch)
  end

  def done

  end
end
