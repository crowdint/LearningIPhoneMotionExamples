class AddNewCityController < UIViewController
  def viewDidLoad
    self.title = "Add New City"

    self.navigationItem.rightBarButtonItem = UIBarButtonItem.
        alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemSave, target: self, action: "save_city:")

    @table_view = UITableView.alloc.initWithFrame(self.view.bounds)
    @table_view.dataSource = self
    @table_view.delegate   = self

    @name_cell  = UITableViewCell.alloc.initWithFrame([[0, 0], [320, 44]])

    name_label = UILabel.alloc.initWithFrame([[10, 11], [42, 21]])
    name_label.text = "City:"

    @name_input = UITextView.alloc.initWithFrame([[60, 0],[260, 44]])
    @name_input.text = "e.g. Paris, Rome"

    @name_cell.addSubview(name_label)
    @name_cell.addSubview(@name_input)
    @name_cell.setSelectionStyle UITableViewCellSelectionStyleNone

    @description_cell = UITableViewCell.alloc.init

    description_label = UILabel.alloc.initWithFrame([[11, 1], [92, 21]])
    description_label.text = "Description:"

    @description_input = UITextView.alloc.initWithFrame([[11, 29], [297, 332]])
    @description_input.text = "Write a description..."

    @description_cell.addSubview(description_label)
    @description_cell.addSubview(@description_input)

    self.view.addSubview(@table_view)
  end

  def tableView(tableView, numberOfRowsInSection:section)
    2
  end

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    case index_path.row
    when 0
      @name_cell
    when 1
      @description_cell
    end
  end

  def tableView(table_view, heightForRowAtIndexPath:index_path)
    if index_path.row == 1
      362
    else
      44
    end
  end

  def save_city(sender)
    cities = App.delegate.cities

    if @name_input.text.size > 0
      city = City.alloc.init
      city.name = @name_input.text
      city.description = @description_input.text
      cities << city
      App.delegate.root_controller.table_view.reloadData
    end

    navigationController.popViewControllerAnimated(true)
  end
end
