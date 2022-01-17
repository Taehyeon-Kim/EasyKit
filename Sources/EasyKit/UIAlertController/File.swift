import UIKit

public extension UIAlertController {
    func addAction(_ actions: UIAlertAction...) {
        for action in actions {
            self.addAction(action)
        }
    }
}
