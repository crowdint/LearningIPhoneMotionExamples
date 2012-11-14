class PrototypeViewController < UIViewController
  def viewDidLoad
    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle "Go!", forState: UIControlStateNormal

    @button.frame = [[124, 218], [73, 44]]

    self.view.backgroundColor = UIColor.whiteColor
    self.view.addSubview @button
  end

  def pushed_go(sender)
  end
end
