class CityController < UIViewController
  def initWithCity(city)
    @city = city
    initWithNibName(nil, bundle: nil)
  end

  def viewDidLoad
    @text_view          = UITextView.alloc.init
    @text_view.frame    = [[0, 223], [320, 256]]
    @text_view.text     = @city.description
    @text_view.editable = false
    @text_view.font     = UIFont.systemFontOfSize(14)

    @image_view       = UIImageView.alloc.initWithFrame([[35, 27], [250, 188]])

    @image_view.image = (@city.picture || UIImage.imageNamed("QuestionMark.jpg"))

    self.title = @city.name
    self.view.addSubview @text_view
    self.view.addSubview @image_view

    self.view.backgroundColor = UIColor.whiteColor

    super
  end
end
