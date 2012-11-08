describe "Hello World" do
  tests HelloWorldController

  it "Changes the label text" do
    button = views(UIButton).first
    label  = views(UILabel).first

    # Need to tap twice or test won't pass
    # probably because of the tipe of event
    # that we're listening for UIControlEventTouchUpInside
    tap button
    tap button

    label.text.should == "Hello World"
  end

end
