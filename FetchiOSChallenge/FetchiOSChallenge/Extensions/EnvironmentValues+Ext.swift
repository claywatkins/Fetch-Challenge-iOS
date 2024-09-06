//
//  EnvironmentValues+Ext.swift
//  FetchiOSChallenge
//
//  Created by Clayton Watkins on 9/5/24.
//

import SwiftUI

extension EnvironmentValues {
    var desertService: DessertService {
        get { self[DessertServiceKey.self] }
        set { self[DessertServiceKey.self] = newValue }
    }
}
