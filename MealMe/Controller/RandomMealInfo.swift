//
//  RandomMealInfo.swift
//  MealMe
//
//  Created by Ahmed ibrahim on 5/17/19.
//  Copyright © 2019 Ahmed ibrahim. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

protocol sendDataForward {
    func sendForward()
}

class RandomMealInfo: UIViewController {

    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealInfoButton: UIButton!
    
    @IBOutlet weak var cardViewContainer: UIView!
    
    let APIURL = "https://www.themealdb.com/api/json/v1/1/random.php"
    let mealData = MealData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMealData(url: APIURL)
        cardViewStyle()
        
        
    }
    
    func getMealData(url: String){
        Alamofire.request(url, method: .get).validate().responseJSON {
            (response) in
            
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print("Success Rquest!")
                
                print("json is: \(json)")                   //for debuffing purposes
                
                self.updateDataModel(json: json)
                self.updateUI()
                
            case .failure(let error):
                print("Request Error: \(error)")
            }
        }
        
    }
    
    func updateDataModel(json: JSON){
        let mealName = json["meals"][0]["strMeal"]
        let mealCategory = json["meals"][0]["strCategory"]
        let mealArea = json["meals"][0]["strArea"]
        let mealImage = json["meals"][0]["strMealThumb"]
        let mealInstructions = json["meals"][0]["strInstructions"]
        let mealVideo = json["meals"][0]["strYoutube"]
        
        print("name: \(mealName)    category: \(mealCategory)   area: \(mealArea)   image: \(mealImage)    video: \(mealVideo)")
        
        mealData.setMealName(name: mealName.string!)
        mealData.setMealCategory(category: mealCategory.string!)
        mealData.setMealArea(area: mealArea.string!)
        mealData.setMealImage(image: mealImage.string!)
        mealData.setMealInstructions(instructions: mealInstructions.string!)
        mealData.setvideoURL(url: mealVideo.string!)
        
        setMealIngredients(json: json)
        setMealQuantities(json: json)
    }
    
    func setMealIngredients(json: JSON){
        //before retreiving any NEW meal, DELETE the old one data.
        mealData.cleanIngredientsArray()
        //retreive the new meal.
        for index in 1...20{
            if(json["meals"][0]["strIngredient\(index)"] == ""){
                print("ingredients for loop stopped!")
                break
            }
            else{
                let ingredient: String = json["meals"][0]["strIngredient\(index)"].string!
                mealData.setIngredientsArray(ingredient: ingredient)
                print("ingredients for loop INDEX is: \(index)  the ingredient name is: \(mealData.getIngredientName(index: index - 1))")
            }
        }
    }
    
    func setMealQuantities(json: JSON){
        //before retreiving any NEW meal, DELETE the old one data.
        mealData.cleanQuantitiesArray()
        //retreive the new meal.
        for index in 1...20{
            if(json["meals"][0]["strMeasure\(index)"] == ""){
                print("Quantities for loop stopped!")
                break
            }
            else{
                let quantity: String = json["meals"][0]["strMeasure\(index)"].string!
                mealData.setQuantityArray(quantity: quantity)
                print("Quantity for loop INDEX is: \(index)  the quantity value is: \(mealData.getQuantityValue(index: index - 1))")
            }
        }
    }
    
    func getMealIngredients() -> [String]{
        //return the ingredients ARRAY.
        return mealData.getAllIngredientsElements()
    }
    func getMealQuantities() -> [String]{
        //return the ingredients ARRAY.
        return mealData.getAllQuantitiesElements()
    }
    
    func updateUI(){
        mealName.text = mealData.getMealName()
        category.text = mealData.getMealCategory()
        area.text = mealData.getMealArea()
        mealImage.sd_setImage(with: URL(string: mealData.getMealImage()), placeholderImage: UIImage(named: "loading"))
    }
    
    @IBAction func showInstructionsButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToMealInstructions", sender: self)
    }
    
    @IBAction func refreshButtonPressed(_ sender: UIBarButtonItem) {
        print("Refresh Button Pressed!")
        getMealData(url: APIURL)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goToMealInstructions":
            let destinationVC = segue.destination as! MealInstructionsViewController
            destinationVC.mealIngredients = getMealIngredients()
            destinationVC.mealQuantities = getMealQuantities()
            destinationVC.mealImageString = mealData.getMealImage()
            destinationVC.Instructions = mealData.getMealInstructions()
            destinationVC.navigationTitle = mealData.getMealName()
            destinationVC.videoURL = mealData.getVideoURL()
            
        default:
            print("switch case default! bitch")
        }
    }
    
    func cardViewStyle(){
        mealInfoButton.layer.cornerRadius = 20
        cardViewContainer.layer.cornerRadius = 10
        cardViewContainer.layer.shadowColor = UIColor.black.cgColor
        cardViewContainer.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)  //Here you control x and y
        cardViewContainer.layer.shadowOpacity = 0.7
        cardViewContainer.layer.shadowRadius = 5.0 //Here your control your blur
        cardViewContainer.layer.masksToBounds =  false
    }
    
}
