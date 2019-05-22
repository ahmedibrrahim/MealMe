//
//  MealData.swift
//  MealMe
//
//  Created by Ahmed ibrahim on 5/17/19.
//  Copyright © 2019 Ahmed ibrahim. All rights reserved.
//

import Foundation

class MealData {
    //Super Cool Code here
    
    var mealName: String = ""
    var mealCategory: String = ""
    var mealArea:String = ""
    var mealImage: String = ""
    var mealInstructions: String = ""
    var videoURL: String = ""
    
    var ingredients = [String]()
    var quantities = [String]()
    
    //*****************************************SETTERS**************************************
    func setMealName(name: String){
        mealName = name
    }
    func setMealCategory(category: String){
        mealCategory = category
    }
    func setMealArea(area: String){
        mealArea = area
    }
    func setMealImage(image: String){
        mealImage = image
    }
    func setIngredientsArray(ingredient: String){
        ingredients.append(ingredient)
    }
    func setQuantityArray(quantity: String){
        quantities.append(quantity)
    }
    func setMealInstructions(instructions: String){
        mealInstructions = instructions
    }
    func setvideoURL(url: String){
        videoURL = url
    }
    
    //*****************************************GETTERS**************************************
    func getMealName() -> String{
        return mealName
    }
    func getMealCategory() -> String{
        return mealCategory
    }
    func getMealArea() -> String{
        return mealArea
    }
    func getMealImage() -> String{
        return mealImage
    }
    func getIngredientName(index: Int) -> String{
        return ingredients[index]
    }
    func getAllIngredientsElements() -> [String]{
        return ingredients
    }
    func getQuantityValue(index: Int) -> String{
        return quantities[index]
    }
    func getAllQuantitiesElements() -> [String]{
        return quantities
    }
    func getMealInstructions() -> String{
        return mealInstructions
    }
    func getVideoURL() -> String{
        return videoURL
    }
    
    //*****************************************OTHER IMPORTANT OPERATIONS********************
    func cleanIngredientsArray(){
        ingredients.removeAll()
        print("\ningredients array has just cleaned successfully!\n")
    }
    func cleanQuantitiesArray(){
        quantities.removeAll()
        print("\nquantities array has just cleaned successfully!\n")
    }
}
