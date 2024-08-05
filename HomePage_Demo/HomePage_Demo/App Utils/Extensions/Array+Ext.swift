//
//  Array+Ext.swift
//  KKR App
//
//  Created by Ajinkya Sonar on 19/07/22.
//

import Foundation
extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
}
