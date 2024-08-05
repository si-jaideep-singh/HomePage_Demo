//
//  ZoomCollectionViewFlowLayout.swift
//  Lucknow Super Giants
//
//  Created by Tejas Kashid on 07/02/24.
//

import UIKit

class ZoomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    let activeDistance: CGFloat = 200
    var zoomFactor: CGFloat = 0.3
    var verticalInsets: CGFloat = 0
    var horizontalInsets: CGFloat = 0

    override init() {
        super.init()
        scrollDirection = .horizontal
        minimumLineSpacing = 20
        itemSize = CGSize(width: 150, height: 150)
    }

    convenience init(zoom: CGFloat) {
        self.init()
        zoomFactor = zoom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepare() {
        guard let collectionView = collectionView else { fatalError() }
        let verticalInsets = (collectionView.frame.height - collectionView.adjustedContentInset.top - collectionView.adjustedContentInset.bottom - itemSize.height) / 2
        let horizontalInsets = (collectionView.frame.width - collectionView.adjustedContentInset.right - collectionView.adjustedContentInset.left - itemSize.width) / 2
        sectionInset = UIEdgeInsets(top: verticalInsets*2, left: horizontalInsets, bottom: 0, right: horizontalInsets)

        super.prepare()
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
//        let rectAttributes = super.layoutAttributesForElements(in: rect)!.map { $0.copy() as! UICollectionViewLayoutAttributes }
        
        guard let rectAttributes = super.layoutAttributesForElements(in: rect)!.map({ $0.copy() }) as? [UICollectionViewLayoutAttributes] else { return nil }
    
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.frame.size)

        // Make the cells be zoomed when they reach the center of the screen
        for attributes in rectAttributes where attributes.frame.intersects(visibleRect) {
            let distance = visibleRect.midX - attributes.center.x
            let normalizedDistance = distance / activeDistance

            if distance.magnitude < activeDistance {
                let zoom = 1 + zoomFactor * (1 - normalizedDistance.magnitude)
                let scale = CGAffineTransform(scaleX: zoom, y: zoom)
                let translate = CGAffineTransform(translationX: 0, y: -45)
//                attributes.transform3D = CATransform3DMakeScale(zoom, 1.5, 1)
                
//                attributes.zIndex = Int(zoom.rounded())
                UIView.animate(withDuration: 1) {
                    attributes.transform = translate.concatenating(scale)
                }
            }
        }

        return rectAttributes
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView = collectionView else { return .zero }

        // Add some snapping behaviour so that the zoomed cell is always centered
        let targetRect = CGRect(x: proposedContentOffset.x, y: 100, width: collectionView.frame.width, height: collectionView.frame.height)
        guard let rectAttributes = super.layoutAttributesForElements(in: targetRect) else { return .zero }

        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalCenter = proposedContentOffset.x + collectionView.frame.width / 2

        for layoutAttributes in rectAttributes {
            let itemHorizontalCenter = layoutAttributes.center.x
            if (itemHorizontalCenter - horizontalCenter).magnitude < offsetAdjustment.magnitude {
                offsetAdjustment = itemHorizontalCenter - horizontalCenter
            }
        }

        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // Invalidate layout so that every cell get a chance to be zoomed when it reaches the center of the screen
        return true
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
//        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        
        guard let context = super.invalidationContext(forBoundsChange: newBounds) as? UICollectionViewFlowLayoutInvalidationContext else { return UICollectionViewFlowLayoutInvalidationContext() }
        
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }
}



