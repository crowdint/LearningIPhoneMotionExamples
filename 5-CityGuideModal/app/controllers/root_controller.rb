class RootController < UIViewController
  attr_accessor :table_view

  def viewDidLoad
    @cities = App.delegate.cities

    self.table_view            = UITableView.alloc.initWithFrame(self.view.bounds)
    self.table_view.dataSource = self
    self.table_view.delegate   = self

    self.view.addSubview self.table_view

    self.table_view.allowsSelectionDuringEditing = true
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.
        initWithBarButtonSystemItem(UIBarButtonSystemItemAdd, target: self, action: "add_city:")
    self.title = "City Guide"
  end

  def add_city(sender)
    add_city_controller = AddNewCityController.alloc.init
    self.presentModalViewController add_city_controller, animated: true
  end

  # DataSource methods

  def tableView(table_view, numberOfRowsInSection: section)
    @cities.size
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @reuse_identifier = "cell"

    cell = table_view.dequeueReusableCellWithIdentifier(@reuse_identifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuse_identifier)
    end

    cell.textLabel.text       = @cities[index_path.row].name
    cell.textColor            = UIColor.blackColor
    cell.editingAccessoryType = UITableViewCellAccessoryNone

    cell
  end

  # Table View delegate methods

  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    city_controller = CityController.alloc.initWithCity(@cities[index_path.row])
    navigationController.pushViewController(city_controller, animated:true)

    table_view.deselectRowAtIndexPath(index_path, animated:true)
    true
  end
end
