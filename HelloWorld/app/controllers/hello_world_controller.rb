class HelloWorldController < UIViewController
  def viewDidLoad
    self.view.backgroundColor = UIColor.whiteColor

    # Create the Label
    @label                 = UILabel.alloc.initWithFrame([[20,20], [280,106]])
    @label.textAlignment   = UITextAlignmentCenter
    @label.backgroundColor = self.view.backgroundColor
    @label.accessibilityLabel = "Label"
    @label.text            = "Label"

    # Create the button
    @button                    = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @button.frame              = [[42,252], [236,44]]
    @button.accessibilityLabel = "Push Me"
    @button.setTitle("Push Me", forState: UIControlStateNormal)

    # Set the button action
    @button.addTarget(self,
        action: :say_hello,
        forControlEvents: UIControlEventTouchUpInside)

    # Add the label and button to view
    self.view.addSubview(@label)
    self.view.addSubview(@button)

    true
  end

  # Handles the button action
  def say_hello
    @label.text = "Hello World"
  end
end
