class RootController < UIViewController
  def viewDidLoad
    @data = City.build_test_data

    @table_view            = UITableView.alloc.initWithFrame(self.view.bounds)
    @table_view.dataSource = self
    @table_view.delegate   = self

    self.view.addSubview @table_view

    self.title = "City Guide"
  end

  # DataSource methods

  def tableView(table_view, numberOfRowsInSection: section)
    @data.size
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @reuse_identifier = "cell"

    cell = table_view.dequeueReusableCellWithIdentifier(@reuse_identifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuse_identifier)
    end

    cell.textLabel.text = @data[index_path.row].name

    cell
  end

  # Table View delegate methods

  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    city_controller = CityController.alloc.initWithCity(@data[index_path.row])

    navigationController.pushViewController(city_controller, animated:true)

    table_view.deselectRowAtIndexPath(index_path, animated:true)
    true
  end
end
