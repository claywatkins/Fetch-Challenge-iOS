//
//  DessertDetail.swift
//  FetchiOSChallenge
//
//  Created by Clayton Watkins on 9/5/24.
//

import SwiftUI

struct DessertDetail: View {
    @Environment(\.desertService) var dessertService
    var dessert: Dessert
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    AsyncImage(url: URL(string: dessert.strMealThumb)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                        
                    } placeholder: {
                        ProgressView()
                    }
                    if let dessert = dessertService.dessert {
                        VStack(alignment: .leading) {
                            Text("Ingredients")
                                .font(.title)
                                .fontWeight(.bold)
                            ForEach(dessertService.ingredients.sorted(by: < ), id: \.key) { ingredient, measurement in
                                HStack {
                                    Text(ingredient)
                                    Text(measurement)
                                }
                            }
                            
                            Text("Instructions")
                                .font(.title)
                                .fontWeight(.bold)
                            Text(dessert.strInstructions ?? "Instructions not available")
                            
                        }
                    }
                    
                }
                .padding(.horizontal, 12)
                .padding(.bottom, 12)
            }
            .navigationTitle(dessert.strMeal)
        }
        .task {
            await dessertService.fetchDetailByID(with: dessert.idMeal)
        }
    }

}

#Preview {
    DessertDetail(dessert: Dessert(strMeal: "Apam balik",
                                   strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                                   idMeal: "53049"))
}
