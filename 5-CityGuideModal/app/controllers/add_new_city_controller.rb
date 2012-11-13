class AddNewCityController < UIViewController
  def viewDidLoad
    self.title = "Add New City"

    navigation_bar                      = UINavigationBar.alloc.initWithFrame([[0, 0], [self.view.bounds.size.width, 44]])
    navigation_title                    = UINavigationItem.alloc.initWithTitle "Add New City"
    done_button                         = UIBarButtonItem.alloc.initWithTitle("Done", style: UIBarButtonItemStyleDone, target: self, action: "save_city:")
    navigation_title.rightBarButtonItem = done_button
    navigation_bar.pushNavigationItem navigation_title


    @table_view = UITableView.alloc.initWithFrame([[0, navigation_bar.frame.size.height],[self.view.bounds.size.width, self.view.bounds.size.height - navigation_bar.frame.size.height]])
    @table_view.dataSource = self
    @table_view.delegate   = self

    # Name Cell
    @name_cell  = UITableViewCell.alloc.initWithFrame([[0, 0], [320, 44]])

    name_label = UILabel.alloc.initWithFrame([[10, 11], [42, 21]])
    name_label.text = "City:"

    @name_input = UITextView.alloc.initWithFrame([[60, 0],[260, 44]])
    @name_input.text = "e.g. Paris, Rome"

    @name_cell.addSubview(name_label)
    @name_cell.addSubview(@name_input)
    @name_cell.setSelectionStyle UITableViewCellSelectionStyleNone

    # Picture Cell
    @picture_cell = UITableViewCell.alloc.init
    @picture_cell.setSelectionStyle UITableViewCellSelectionStyleNone

    picture_label      = UILabel.alloc.initWithFrame [[10, 28], [126, 21]]
    picture_label.text = "Add a Picture:"

    @picture_view             = UIImageView.alloc.initWithFrame [[186, 7], [83, 63]]
    @picture_view.image       = UIImage.imageNamed("QuestionMark.jpg")
    @picture_view.contentMode = UIViewContentModeScaleAspectFit

    @picture_button       = UIButton.buttonWithType UIButtonTypeContactAdd
    @picture_button.frame = [[274, 25], [29, 29]]
    @picture_button.addTarget self, action: "add_picture:", forControlEvents:UIControlEventTouchUpInside

    @picture_cell.addSubview @picture_view
    @picture_cell.addSubview @picture_button
    @picture_cell.addSubview picture_label


    # Description Cell
    @description_cell = UITableViewCell.alloc.init

    description_label = UILabel.alloc.initWithFrame([[11, 1], [92, 21]])
    description_label.text = "Description:"

    @description_input = UITextView.alloc.initWithFrame([[11, 29], [297, 332]])
    @description_input.text = "Write a description..."

    @description_cell.addSubview(description_label)
    @description_cell.addSubview(@description_input)

    self.view.addSubview(@table_view)
    self.view.addSubview(navigation_bar)

    # Picker Controller
    @picker_controller = UIImagePickerController.alloc.init
    @picker_controller.allowsImageEditing = false
    @picker_controller.delegate = self
    @picker_controller.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum
  end

  def tableView(tableView, numberOfRowsInSection:section)
    3
  end

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    case index_path.row
    when 0
      @name_cell
    when 1
      @picture_cell
    when 2
      @description_cell
    end
  end

  def tableView(table_view, heightForRowAtIndexPath:index_path)
    case index_path.row
    when 0
      44
    when 1
      83
    when 2
      279
    end
  end

  def save_city(sender)
    cities = App.delegate.cities

    if @name_input.text.size > 0
      city = City.alloc.init
      city.name        = @name_input.text
      city.description = @description_input.text
      city.picture     = @picture_view.image
      cities << city
      App.delegate.root_controller.table_view.reloadData
    end

    self.dismissModalViewControllerAnimated true
  end

  def add_picture(sender)
    self.presentModalViewController @picker_controller, animated:true
  end

  # Image Picker Controller delegate methods
  def imagePickerController(picker, didFinishPickingMediaWithInfo:info)
    self.dismissModalViewControllerAnimated true
    city_picture = info["UIImagePickerControllerOriginalImage"]
    @picture_view.image = city_picture
    @table_view.reloadData
  end
end
