class PrototypeViewController < UIViewController
  def viewDidLoad
    width = self.view.bounds.size.width

    @button = UIButton.buttonWithType UIButtonTypeRoundedRect
    @button.setTitle "Go!", forState: UIControlStateNormal

    @button.frame = [[124, 218], [73, 44]]

    @button.addTarget(self, action: "pushed_go:", forControlEvents:UIControlEventTouchUpInside)

    @label_view = UILabel.alloc.initWithFrame([[0, 219+44], [width,44]])
    @label_view.textAlignment = NSTextAlignmentCenter

    self.view.backgroundColor = UIColor.whiteColor
    self.view.addSubview @button
    self.view.addSubview @label_view
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

  def mailComposeController(controller, didFinishWithResult: result, error: error)
    if error
      error_title = "Mail Error"
      error_description = error.localizedDescription
      error_view = UIAlertView.alloc.initWithTitle(error_title,
          message: error_description,
          delegate: self,
          cancelButtonTitle: nil,
          otherButtonTitles: "OK")
    else
      string = case result
        when MFMailComposeResultSent
          "Mail Sent"
        when MFMailComposeResultSaved
          "Mail Saved"
        when MFMailComposeResultCancelled
          "Mail Cancelled"
        when MFMailComposeResultFailed
          "Mail Failed"
        else
          "Unknown"
      end

      @label_view.text = string
    end

    self.dismissModalViewControllerAnimated true
  end
end
