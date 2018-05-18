//
//  AnimalTableViewController.swift
//  IndexedTableDemo
//
//  Created by Simon Ng on 3/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class AnimalTableViewController: UITableViewController {
    
    var animalsDict = [String: [String]]()
    var animalSectionTitles = [String]()
    
    let animals = ["Bear", "Black Swan", "Buffalo", "Camel", "Cockatoo", "Dog", "Donkey", "Emu", "Giraffe", "Greater Rhea", "Hippopotamus", "Horse", "Koala", "Lion", "Llama", "Manatus", "Meerkat", "Panda", "Peacock", "Pig", "Platypus", "Polar Bear", "Rhinoceros", "Seagull", "Tasmania Devil", "Whale", "Whale Shark", "Wombat"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createAnimalDict()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Helper Methods
    func createAnimalDict() {
        for animal in animals {
//            let firstLetterIndex = animal.index(animal.startIndex, offsetBy: 1)
//            let animalKey = String(animal[..<firstLetterIndex])
            let key = String(animal.first!)
            
            if var values = animalsDict[key] {
                values.append(animal)
                animalsDict[key] = values
            } else {
                animalsDict[key] = [animal]
            }
        }
        
        animalSectionTitles = [String](animalsDict.keys)
        animalSectionTitles.sort() { $0 < $1 }
    }
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return animalSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalSectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = animalSectionTitles[section]
        let values = animalsDict[key]!
        return values.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configure the cell...
        let key = animalSectionTitles[indexPath.section]
        let animalValues = animalsDict[key]!
        let animal = animalValues[indexPath.row]
        cell.textLabel?.text = animal
        
        
        // Convert the animal name to lower case and
        // then replace all occurences of a space with an underscore
        let imageFileName = animal.lowercased().replacingOccurrences(of: " ", with: "_")
        cell.imageView?.image = UIImage(named: imageFileName)
        
        return cell
    }
    
    
}
