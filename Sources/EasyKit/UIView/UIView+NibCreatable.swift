import UIKit

extension UIView: NibCreatable {
    public final class func instanceFromNib() -> Self {
        return nib.instantiate(withOwner: nil, options: nil).last as! Self
    }
}
