import UIKit
import WebKit

public class WebToDo: UIViewController {
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    lazy var webViews: WKWebView = {
        let wv = WKWebView()
        wv.translatesAutoresizingMaskIntoConstraints = false
        wv.allowsBackForwardNavigationGestures = true

        return wv
    }()
    
    public var todoTitle = "Marussia ToDo"
    public var webURL = "http://todo.marussia.org/"

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webViews)
        webViews.fillSuperview()

        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.title = "\(todoTitle)"

        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }

        if let url = URL (string: "\(webURL)") {
          let requestObj = URLRequest(url: url)
          webViews.load(requestObj)
        } else {
          
        }
    }
}

extension UIView {
  public func fillSuperview() {
    translatesAutoresizingMaskIntoConstraints = false
    if let superview = superview {
      leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
      rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
      topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
      bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
  }
}

