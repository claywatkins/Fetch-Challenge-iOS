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
    var dessert: Dessert?
    var fetchAllURL = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!
    var fetchDetailURLString = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    
    // Fetch All Deserts
    func fetchAll() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: fetchAllURL)
            let meals = try JSONDecoder().decode(Meals.self, from: data)
            self.meals = meals.meals.sorted(by: { $0.strMeal < $1.strMeal })
            DispatchQueue.main.async {
                self.isLoading = false
            }
        } catch {
            print("Invalid Data")
            print(error.localizedDescription)
        }
    }
    
    // Fetch Deserts by id
    func fetchDetailByID(with id: String) async {
        let finalURL = URL(string: fetchDetailURLString + id)!

        do {
            let (data, _) = try await URLSession.shared.data(from: finalURL)
            let meal = try JSONDecoder().decode(Meals.self, from: data)
            
            if let dessert = meal.meals.first {
                self.dessert = dessert
            }
        } catch {
            print("Error decoding Detail")
            print(error.localizedDescription)
        }
    }
    
    private func filterDeadIngredients(dessert: Dessert) -> [String: String?]{
        var ingredients = [
            dessert.strIngredient1,
            dessert.strIngredient2,
            dessert.strIngredient3,
            dessert.strIngredient4,
            dessert.strIngredient5,
            dessert.strIngredient6,
            dessert.strIngredient7,
            dessert.strIngredient8,
            dessert.strIngredient9,
            dessert.strIngredient10,
            dessert.strIngredient11,
            dessert.strIngredient12,
            dessert.strIngredient13,
            dessert.strIngredient14,
            dessert.strIngredient15,
            dessert.strIngredient16,
            dessert.strIngredient17,
            dessert.strIngredient18,
            dessert.strIngredient19,
            dessert.strIngredient20,
        ].filter( { $0 != "" })
        
        var measurements = [
            dessert.strMeasure1,
            dessert.strMeasure2,
            dessert.strMeasure3,
            dessert.strMeasure4,
            dessert.strMeasure5,
            dessert.strMeasure6,
            dessert.strMeasure7,
            dessert.strMeasure8,
            dessert.strMeasure9,
            dessert.strMeasure10,
            dessert.strMeasure11,
            dessert.strMeasure12,
            dessert.strMeasure13,
            dessert.strMeasure14,
            dessert.strMeasure15,
            dessert.strMeasure16,
            dessert.strMeasure17,
            dessert.strMeasure18,
            dessert.strMeasure19,
            dessert.strMeasure20,
        ].filter( { $0 != "" })
        
        let final = Dictionary(uniqueKeysWithValues: zip(ingredients, measurements))
        return final
    }
}
