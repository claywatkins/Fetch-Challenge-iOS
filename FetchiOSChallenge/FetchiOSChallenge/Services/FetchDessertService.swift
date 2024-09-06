//
//  FetchService.swift
//  FetchiOSChallenge
//
//  Created by Clayton Watkins on 9/5/24.
//

import Foundation

@Observable
class FetchDessertService {
    var isLoading = false
    var meals: [Dessert] = []
    var fetchAllURL = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
    var fetchDetailURL = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=")!
    
    // Fetch All Deserts
    func fetchAll() async throws {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: fetchAllURL)
            let meals = try JSONDecoder().decode(Meals.self, from: data)
            DispatchQueue.main.async {
                self.meals = meals.meals.sorted(by: { $0.strMeal < $1.strMeal })
                self.isLoading = false
            }
        } catch {
            print("Invalid Data")
            print(error.localizedDescription)
        }
    }
    // Fetch Deserts by id
    
}
