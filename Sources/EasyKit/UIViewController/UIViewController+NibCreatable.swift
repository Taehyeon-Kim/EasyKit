import UIKit

extension UIViewController: NibCreatable {
    public final class var nib: UINib {
        let nibName = Self.nibName
        let nibBundle = Self.nibBundle
        return UINib(nibName: nibName, bundle: nibBundle)
    }
    
    @objc
    public class var nibBundle: Bundle? {
        return Bundle(for: self)
    }
    
    @objc
    public class var nibName: String {
        return "\(self)"
    }
    
    public final class func instanceFromNib() -> Self {
        return Self.init(nibName: nibName, bundle: nibBundle)
    }
}
