//
//  Collection+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 08/08/22.
//

import Foundation

extension Collection {
    subscript(safe index: Index?) -> Element? {
        if let index = index {
            return indices.contains(index) ? self[index] : nil
        }
        return nil
    }
}
