//
//  ZoomCenterFlowLayout.swift
//  Lucknow Super Giants
//
//  Created by Tejas Kashid on 13/02/24.
//
import UIKit

class ZoomCenterFlowLayout: UICollectionViewFlowLayout {
    let activeDistance: CGFloat = 200
    var zoomFactor: CGFloat = 0.3
    
    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumLineSpacing = 20
        itemSize = CGSize(width: 150, height: 150)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }

        let attributes = super.layoutAttributesForElements(in: rect)?.map { $0.copy() as! UICollectionViewLayoutAttributes }

        let centerY = collectionView.bounds.height - itemSize.height / 2

        attributes?.forEach { attribute in
            let distance = attribute.center.x - collectionView.contentOffset.x - collectionView.bounds.width / 2
            let normalizedDistance = abs(distance) / (collectionView.bounds.width / 2)

            let zoom = 1.0 + 0.5 * (1.0 - normalizedDistance)
            attribute.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0)

            attribute.center.y = centerY
        }

        return attributes
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
