//
//  File.swift
//  MyProject
//
//  Created by Yaroslav on 25.12.2021.
//

import Foundation

struct Person {
    let name: String
    let surname: String
    let theModelOfCar: String
    let numberOfTheCar: String
    let job: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}

extension Person {
    static func getPerson() -> [Person] {
        var persons: [Person] = []
        
        let names = DataManager.shared.names
        let surnames = DataManager.shared.surnames
        let theModelsOfCars = DataManager.shared.theModelsOfCars
        let numbersOfTheCars = DataManager.shared.numbersOfTheCars
        let jobs = DataManager.shared.jobs
        
        for index in 0..<names.count {
            let person: Person = Person(name: names[index],
                                        surname: surnames[index],
                                        theModelOfCar: theModelsOfCars[index],
                                        numberOfTheCar: numbersOfTheCars[index],
                                        job: jobs[index])
            persons.append(person)
        }
        return persons
    }
}

enum Pictures: String {
    case name = "person"
    case surname = "person.fill"
    case theModelOfCar = "car"
    case numberOfTheCar = "car.fill"
    case job = "paperclip"
}

enum AboutPersonVCState {
    case name
    case car
    case noSelected
}
