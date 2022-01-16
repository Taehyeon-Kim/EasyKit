import UIKit

extension UIStackView {
    // UIView 여러 개 인자로 받아서 한 번에 addArrangedSubview
    public func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
