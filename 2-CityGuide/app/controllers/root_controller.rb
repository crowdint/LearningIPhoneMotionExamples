class RootController < UIViewController
  attr_accessor :table_view

  def viewDidLoad
    @cities = App.delegate.cities

    self.table_view            = UITableView.alloc.initWithFrame(self.view.bounds)
    self.table_view.dataSource = self
    self.table_view.delegate   = self

    self.view.addSubview self.table_view

    self.navigationItem.rightBarButtonItem = self.editButtonItem
    self.table_view.allowsSelectionDuringEditing = true
    self.title = "City Guide"
  end

  # DataSource methods

  def tableView(table_view, numberOfRowsInSection: section)
    count = @cities.size
    count += 1 if self.editing?

    count
  end

  def tableView(table_view, cellForRowAtIndexPath: index_path)
    @reuse_identifier = "cell"

    cell = table_view.dequeueReusableCellWithIdentifier(@reuse_identifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:@reuse_identifier)
    end

    if index_path.row < @cities.count
      cell.textLabel.text       = @cities[index_path.row].name
      cell.textColor            = UIColor.blackColor
      cell.editingAccessoryType = UITableViewCellAccessoryNone
    else
      cell.textLabel.text       = "Add New City"
      cell.textLabel.textColor  = UIColor.lightGrayColor
      cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator
    end

    cell
  end

  def setEditing(editing, animated:animated)
    if(editing != self.editing?)
      super
      self.table_view.setEditing(editing, animated:animated)

      indices = []
      @cities.size.times do |i|
        indices << NSIndexPath.indexPathForRow(i, inSection: 0)
      end

      last_index = [NSIndexPath.indexPathForRow(@cities.count, inSection: 0)]

      if self.editing?
        indices.each do |index|
          cell = table_view.cellForRowAtIndexPath index
          cell.setSelectionStyle UITableViewCellSelectionStyleNone
        end
        self.table_view.insertRowsAtIndexPaths(last_index, withRowAnimation:UITableViewRowAnimationLeft)
      else
        indices.each do |index|
          cell = table_view.cellForRowAtIndexPath index
          cell.setSelectionStyle UITableViewCellSelectionStyleBlue
        end
        self.table_view.deleteRowsAtIndexPaths(last_index, withRowAnimation:UITableViewRowAnimationLeft)
      end
    end
  end

  # Table View delegate methods

  def tableView(table_view, didSelectRowAtIndexPath: index_path)
    if ((index_path.row < @cities.count) && !self.editing?)
      city_controller = CityController.alloc.initWithCity(@cities[index_path.row])
      navigationController.pushViewController(city_controller, animated:true)
    end

    if (index_path.row == @cities.count && self.editing?)
      add_new_city_controller = AddNewCityController.alloc.init
      navigationController.pushViewController(add_new_city_controller, animated:true)
    end

    table_view.deselectRowAtIndexPath(index_path, animated:true)
    true
  end

  def tableView(table_view, editingStyleForRowAtIndexPath: index_path)
    if index_path.row < @cities.count
      UITableViewCellEditingStyleDelete
    else
      UITableViewCellEditingStyleInsert
    end
  end

  def tableView(table_view, commitEditingStyle: editing, forRowAtIndexPath: index_path)
    if editing == UITableViewCellEditingStyleDelete
      @cities.delete_at(index_path.row)
      table_view.deleteRowsAtIndexPaths([index_path], withRowAnimation:UITableViewRowAnimationLeft)
    end
  end
end
