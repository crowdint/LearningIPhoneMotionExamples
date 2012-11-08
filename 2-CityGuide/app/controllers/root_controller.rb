class RootController < UIViewController
  attr_accessor :cities

  def viewDidLoad
    self.cities = City.build_test_data

    @table_view            = UITableView.alloc.initWithFrame(self.view.bounds)
    @table_view.dataSource = self
    @table_view.delegate   = self

    self.view.addSubview @table_view

    self.navigationItem.rightBarButtonItem = self.editButtonItem
    self.title = "City Guide"
  end

  # DataSource methods

  def tableView(table_view, numberOfRowsInSection: section)
    count = cities.size
    count += 1 if self.editing?

    count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @reuse_identifier = "cell"

    cell = table_view.dequeueReusableCellWithIdentifier(@reuse_identifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuse_identifier)
    end

    if index_path.row < cities.count
      cell.textLabel.text = cities[index_path.row].name
    else
      cell.textLabel.text       = "Add New City"
      cell.textLabel.textColor  = UIColor.lightGrayColor
      cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator
    end

    cell
  end

  def setEditing(editing, animated:animated)
    super
    @table_view.setEditing(editing, animated:animated)
    @table_view.reloadData
  end

  # Table View delegate methods

  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    city_controller = CityController.alloc.initWithCity(cities[index_path.row])

    navigationController.pushViewController(city_controller, animated:true)

    table_view.deselectRowAtIndexPath(index_path, animated:true)
    true
  end

  def tableView(table_view, editingStyleForRowAtIndexPath: index_path)
    if index_path.row < cities.count
      UITableViewCellEditingStyleDelete
    else
      UITableViewCellEditingStyleInsert
    end
  end

end
