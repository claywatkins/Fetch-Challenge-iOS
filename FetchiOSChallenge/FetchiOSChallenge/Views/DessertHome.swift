//
//  DessertHomeView.swift
//  FetchiOSChallenge
//
//  Created by Clayton Watkins on 9/5/24.
//

import SwiftUI

struct DessertHomeView: View {
    @Environment(\.desertService) var dessertService
    
    var body: some View {
        NavigationView {
            VStack {
                if dessertService.isLoading {
                    ProgressView("Loading Desserts...")
                } else {
                    List(dessertService.meals, id: \.idMeal) { dessert in
                        NavigationLink {
                            DessertDetail(dessert: dessert)
                                .environment(dessertService)
                        } label: {
                            Text(dessert.strMeal)
                        }
                    }
                }
            }
            .navigationTitle("Desserts")
        }
        .task{
            await dessertService.fetchAll()
        }
    }
}

#Preview {
    DessertHomeView()
}
