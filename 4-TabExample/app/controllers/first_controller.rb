class FirstController < UIViewController
  def initWithNibName(nib_name, bundle: bundle)
    self.tabBarItem = UITabBarItem.alloc.initWithTitle("First", image: nil, tag: 0)

    super
  end

  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor

    label               = UILabel.alloc.initWithFrame(self.view.bounds)
    label.text          = "1"
    label.font          = UIFont.systemFontOfSize(300)
    label.textAlignment = NSTextAlignmentCenter

    self.view.addSubview label

    super
  end
end
