class FirstController < UIViewController
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
