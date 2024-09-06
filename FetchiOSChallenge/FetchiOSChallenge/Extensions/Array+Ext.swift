//
//  Array+Ext.swift
//  FetchiOSChallenge
//
//  Created by Clayton Watkins on 9/5/24.
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
