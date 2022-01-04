import UIKit

extension UIViewController: NibCreatable {
    public final class func instanceFromNib() -> Self {
        return Self.init(nibName: nibName, bundle: nibBundle)
    }
}
