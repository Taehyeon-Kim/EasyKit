import UIKit

extension UICollectionReusableView: Reusable {}

public extension UICollectionView {
    
    // MARK: - UICollectionViewCell
    
    final func register<T: UICollectionViewCell>(_ cellType: T.Type) {
        let bundle = T.nibBundle
        
        if bundle?.path(forResource: T.reuseIdentifier, ofType: "nib") != nil {
            self.register(cellType.nib,
                          forCellWithReuseIdentifier: cellType.reuseIdentifier)
        } else {
            self.register(cellType.self,
                          forCellWithReuseIdentifier: cellType.reuseIdentifier)
        }
    }
    
    final func dequeueReusableCell<T: UICollectionViewCell>(
        for indexPath: IndexPath,
        cellType: T.Type = T.self
    ) -> T {
        let bareCell = self.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier,
                                                for: indexPath)
        guard let cell = bareCell as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                + "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
                + "and that you registered the cell beforehand"
            )
        }
        return cell
    }
    
    // MARK: - UICollectionReusableView
    
    final func register<T: UICollectionReusableView>(
        supplementaryViewType: T.Type,
        ofKind elementKind: String
    ) {
        let bundle = T.nibBundle
        
        if bundle?.path(forResource: T.reuseIdentifier, ofType: "nib") != nil {
            self.register(
                supplementaryViewType.nib,
                forSupplementaryViewOfKind: elementKind,
                withReuseIdentifier: supplementaryViewType.reuseIdentifier
            )
        } else {
            self.register(
                supplementaryViewType.self,
                forSupplementaryViewOfKind: elementKind,
                withReuseIdentifier: supplementaryViewType.reuseIdentifier
            )
        }
    }
    
    final func dequeueHeaderView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError("Failed to dequeue a header view with identifier \(T.reuseIdentifier) ")
        }
        return view
    }
    
    final func dequeueFooterView<T: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.reuseIdentifier,
            for: indexPath
        ) as? T else {
            fatalError("Failed to dequeue a footer view with identifier \(T.reuseIdentifier) ")
        }
        return view
    }
}
