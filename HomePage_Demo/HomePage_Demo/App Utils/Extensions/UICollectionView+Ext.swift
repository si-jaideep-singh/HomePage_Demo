//
//  UICollectionView+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 06/12/22.
//

import UIKit

extension UICollectionView {
    func registerCells(cellIdentifiers: [String], bundle: Bundle = .main) {
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
        }
    }
    
    func isLastRow(indexPath: IndexPath) -> Bool {
        let lastSectionIndex = self.numberOfSections - 1
        let lastRowIndex = self.numberOfItems(inSection: lastSectionIndex) - 1
        if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex {
            return true
        }
        return false
    }
    
    var visibleCurrentCellIndexPath: IndexPath? {
        for cell in self.visibleCells {
            let indexPath = self.indexPath(for: cell)
            return indexPath
        }
        return nil
    }
    
    func displayNoContentLabel(noContent: Bool = false) {
        DispatchQueue.main.async {
            if noContent {
                let noContentLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height))
                noContentLabel.text = "No Results Found."
                noContentLabel.textAlignment = .center
                noContentLabel.numberOfLines = 0
                noContentLabel.lineBreakMode = .byWordWrapping
                noContentLabel.backgroundColor = .clear
                noContentLabel.textColor = UIColor.getAppColor(colorName: .white_FFFFFF)
                noContentLabel.font = UIFont.customFont(customFont: .hindBold, size: 14)
                self.backgroundView = noContentLabel
            } else {
                self.backgroundView = nil
            }
        }
    }
}
