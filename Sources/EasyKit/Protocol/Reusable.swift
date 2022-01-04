import UIKit

public protocol Reusable: AnyObject {
    // To use when registering and dequeuing a reusable cell
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
