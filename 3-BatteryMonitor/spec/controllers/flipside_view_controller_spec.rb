describe FlipsideViewController do
  tests FlipsideViewController

  describe "Toggle the switch" do
    it "turns the monitoring on" do
  		tap 'monitor switch'
      flick 'monitor switch', :to => :right
      tap 'Done'

      App.delegate.monitor_battery.should.equal true
    end
  end
end
