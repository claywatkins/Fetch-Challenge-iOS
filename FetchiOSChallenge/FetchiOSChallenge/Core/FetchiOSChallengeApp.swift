//
//  FetchiOSChallengeApp.swift
//  FetchiOSChallenge
//
//  Created by Clayton Watkins on 9/5/24.
//

import SwiftUI

@main
struct FetchiOSChallengeApp: App {
    @State var dessertService = DessertService()
    
    var body: some Scene {
        WindowGroup {
            DessertHomeView()
                .environment(dessertService)
        }
    }
}
