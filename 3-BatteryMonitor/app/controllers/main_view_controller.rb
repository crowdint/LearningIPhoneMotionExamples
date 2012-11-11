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

  # Target Action for the info button
  def show_info
    controller = FlipsideViewController.alloc.initWithNibName(nil, bundle:nil)
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
    self.presentViewController(controller, animated: true, completion: nil)
  end
end
