describe City do
  describe ".build_test_data" do
    it "returns an array of cities" do
      City.build_test_data.size.should == 4
      City.build_test_data.first.name.should == "London"
    end
  end
end
