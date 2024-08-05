//
//  UITableView+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 06/12/22.
//

import UIKit

extension UITableView {
    func registerCells(cellIdentifiers: [String], bundle: Bundle = .main) {
        for identifier in cellIdentifiers {
            self.register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
        }
    }
    
    func isLastRow(indexPath: IndexPath) -> Bool {
        let lastSectionIndex = self.numberOfSections - 1
        let lastRowIndex = self.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section == lastSectionIndex && indexPath.row == lastRowIndex {
            return true
        }
        return false
    }
    
    func isLastRowInSection(indexPath: IndexPath) -> Bool {
        let totalRow = numberOfRows(inSection: indexPath.section)
        return indexPath.row == totalRow - 1
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
    
    final class ContentSizedTableView: UITableView {
        override var contentSize:CGSize {
            didSet {
                invalidateIntrinsicContentSize()
            }
        }

        override var intrinsicContentSize: CGSize {
            layoutIfNeeded()
            return CGSize(width: UIView.noIntrinsicMetric,
                         height: contentSize.height + adjustedContentInset.top)
        }
    }
    
}
