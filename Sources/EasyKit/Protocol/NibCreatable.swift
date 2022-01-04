import UIKit

public protocol NibCreatable {
    static var nib: UINib { get }
    static var nibBundle: Bundle? { get }
    static var nibName: String { get }
    static func instanceFromNib() -> Self
}

public extension NibCreatable {
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
}
