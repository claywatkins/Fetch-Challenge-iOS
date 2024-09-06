//
//  FetchiOSChallengeApp.swift
//  FetchiOSChallenge
//
//  Created by Clayton Watkins on 9/5/24.
//

import SwiftUI

@main
struct FetchiOSChallengeApp: App {
    @State var fetchDessertService = FetchDessertService()
    
    var body: some Scene {
        WindowGroup {
            DessertHomeView()
                .environment(fetchDessertService)
        }
    }
}
