class WebViewController < UIViewController
  def initWithUrl(url, andTitle: title)
    @url   = url
    @title = title
    self.initWithNibName nil, bundle: nil
  end

  def initWithUrl(url)
    self.initWithUrl(url, andTitle: nil)
  end

  def viewDidLoad
    width  = self.view.bounds.size.width
    height = self.view.bounds.size.height

    nav_bar = UINavigationBar.alloc.initWithFrame([[0,0], [width, 44]])

    nav_item = UINavigationItem.alloc.initWithTitle @title
    nav_item.leftBarButtonItem = UIBarButtonItem.alloc.
        initWithBarButtonSystemItem(UIBarButtonSystemItemDone, target: self, action: "done:")

    nav_bar.pushNavigationItem nav_item, animated:false

    @web_view          = UIWebView.alloc.initWithFrame([[0, 44], [width, height - 44]])
    @web_view.delegate = self
    request            = NSURLRequest.requestWithURL @url
    @web_view.loadRequest request

    self.view.addSubview nav_bar
    self.view.addSubview @web_view
  end

  def done(sender)
    self.dismissModalViewControllerAnimated true
  end

  def viewWillDisappear(animated)
    @web_view.delegate = nil
    @web_view.stopLoading
    super
  end

  def webViewDidStartLoad(wv)
    UIApplication.sharedApplication.networkActivityIndicatorVisible = true
  end

  def webViewDidFinishLoad(wv)
    UIApplication.sharedApplication.networkActivityIndicatorVisible = false
  end

  def webView(wv, didFailLoadWithError: error)
    UIApplication.sharedApplication.networkActivityIndicatorVisible = false
    error_string = error.localizedDescription
    error_title = "Error #{error.code}"

    error_view = UIAlertView.alloc.
        initWithTitle(error_title,
                      message: error_string,
                      delegate: self,
                      cancelButtonTitle: nil,
                      otherButtonTitles: "OK", nil)

    error_view.show
  end

  def didPresentAlertView(alert_view)
    self.dismissModalViewControllerAnimated true
  end
end
