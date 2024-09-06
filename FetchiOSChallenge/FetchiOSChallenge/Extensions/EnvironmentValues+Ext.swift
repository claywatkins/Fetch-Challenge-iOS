//
//  EnvironmentValues+Ext.swift
//  FetchiOSChallenge
//
//  Created by Clayton Watkins on 9/5/24.
//

import SwiftUI

extension EnvironmentValues {
    var fetchDesertService: FetchDessertService {
        get { self[FetchDessertServiceKey.self] }
        set { self[FetchDessertServiceKey.self] = newValue }
    }
}
