class PrototypeViewController < UIViewController
  def viewDidLoad
    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle "Go!", forState: UIControlStateNormal

    @button.frame = [[124, 218], [73, 44]]

    @button.addTarget(self, action: "pushed_go:", forControlEvents:UIControlEventTouchUpInside)

    self.view.backgroundColor = UIColor.whiteColor
    self.view.addSubview @button
  end

  def pushed_go(sender)
    url                 = NSURL.URLWithString "http://www.apple.com"
    web_view_controller = WebViewController.alloc.initWithUrl url, andTitle: "Apple"
    self.presentModalViewController(web_view_controller, animated:true)
  end
end
