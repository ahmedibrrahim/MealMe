//
//  MealInstructionsViewController.swift
//  MealMe
//
//  Created by Ahmed ibrahim on 5/17/19.
//  Copyright © 2019 Ahmed ibrahim. All rights reserved.
//

import UIKit
import SDWebImage

class MealInstructionsViewController: UIViewController {

    @IBOutlet weak var cardViewContainer: UIView!
    
    @IBOutlet var ingredientsLabels: [UILabel]!
    @IBOutlet var quantitiesLabels: [UILabel]!
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealInstructions: UILabel!
    @IBOutlet weak var screenTitle: UINavigationItem!
    
    var mealIngredients = [String]()
    var mealQuantities = [String]()
    var mealImageString: String = ""
    var Instructions: String = ""
    var navigationTitle: String = ""
    var videoURL: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardViewStyle()
        updateUI()
        
//        for index in 0...mealIngredients.count - 1{
//            print("index: \(index)   value: \(mealIngredients[index])")
//        }
        
    }
    
    func updateUI(){
        for index in 0...mealIngredients.count - 1{
            ingredientsLabels[index].text = mealIngredients[index]
        }
        for index in 0...mealQuantities.count - 1{
            quantitiesLabels[index].text = mealQuantities[index]
        }
        mealImage.sd_setImage(with: URL(string: mealImageString), placeholderImage: UIImage(named: "loading"))
        mealInstructions.text = Instructions
        screenTitle.title = navigationTitle
    }
    
    func cardViewStyle(){
        cardViewContainer.layer.cornerRadius = 10
        cardViewContainer.layer.shadowColor = UIColor.black.cgColor
        cardViewContainer.layer.shadowOffset = CGSize(width: 0.7, height: 0.7)  //Here you control x and y
        cardViewContainer.layer.shadowOpacity = 0.7
        cardViewContainer.layer.shadowRadius = 5.0 //Here your control your blur
        cardViewContainer.layer.masksToBounds =  false
    }
    @IBAction func youtubeIconPressed(_ sender: UIBarButtonItem) {
        //Go To Youtube website
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "goToVideoScreen":
            let destinationVC = segue.destination as! VideoViewController
            destinationVC.url = videoURL
            
        default:
            print("something wrong happened in \"goToVideoScreen\"")
        }
    }
    
}
