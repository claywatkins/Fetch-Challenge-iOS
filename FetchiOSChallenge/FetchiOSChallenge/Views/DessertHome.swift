//
//  DessertHomeView.swift
//  FetchiOSChallenge
//
//  Created by Clayton Watkins on 9/5/24.
//

import SwiftUI

struct DessertHomeView: View {
    @Environment(\.fetchDesertService) var fetchDessertService
    
    var body: some View {
        NavigationView {
            VStack {
                if fetchDessertService.isLoading {
                    ProgressView("Loading Desserts...")
                } else {
                    List(fetchDessertService.meals, id: \.idMeal) { dessert in
                        Text(dessert.strMeal)
                    }
                }
            }
            .navigationTitle("Desserts")
        }
        .task{
            await fetchDessertService.fetchAll()
        }
    }
}

#Preview {
    DessertHomeView()
}
