describe "Application 'HelloWorld'" do
  before do
    @app = UIApplication.sharedApplication
  end

  it "has one window" do
    @app.windows.size.should == 2
  end
end
