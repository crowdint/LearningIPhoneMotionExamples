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
    if !MFMailComposeViewController.canSendMail
      error_title = "Error"
      error_string = "This device is not configured to send email."

      error_view = UIAlertView.alloc.initWithTitle(error_title,
          message: error_title,
          delegate: self,
          cancelButtonTitle: nil,
          otherButtonTitles: "OK")

      error_view.show
    else
      mail_view = MFMailComposeViewController.alloc.init
      mail_view.mailComposeDelegate = self
      mail_view.setSubject "Test"
      mail_view.setMessageBody "This is a test message", isHTML: false
      presentModalViewController mail_view, animated:true
    end
  end
end
