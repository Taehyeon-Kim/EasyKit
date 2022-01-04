import UIKit

extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}

public extension UITableView {
    
    // MARK: - UITableViewCell
    
    final func register<T: UITableViewCell>(_ : T.Type) {
        let bundle = T.nibBundle
        
        if bundle?.path(forResource: T.reuseIdentifier, ofType: "nib") != nil {
            self.register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
        } else {
            self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
        }
    }
    
    final func dequeueReusableCell<T: UITableViewCell>(
        for indexPath: IndexPath,
        cellType: T.Type = T.self
    ) -> T {
        guard let cell = self.dequeueReusableCell(
            withIdentifier: cellType.reuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                + "and that you registered the cell beforehand"
            )
        }
        return cell
    }
    
    // MARK: - UITableViewHeaderFooterView
    
    final func register<T: UITableViewHeaderFooterView>(_ headerFooterViewType: T.Type) {
        let bundle = T.nibBundle
        
        if bundle?.path(forResource: T.reuseIdentifier, ofType: "nib") != nil {
            self.register(
                headerFooterViewType.nib,
                forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier
            )
        } else {
            self.register(
                headerFooterViewType.self,
                forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier
            )
        }
    }
    
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(_ viewType: T.Type = T.self) -> T {
        guard let view = self.dequeueReusableHeaderFooterView(
            withIdentifier: viewType.reuseIdentifier
        ) as? T else {
            fatalError(
                "Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) "
                + "matching type \(viewType.self). "
                + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                + "and that you registered the header/footer beforehand"
            )
        }
        return view
    }
}
