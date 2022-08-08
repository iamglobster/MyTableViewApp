//
//  Constant.swift
//  MyProject
//
//  Created by Oleksand Kovalov on 27.12.2021.
//

import Foundation
import UIKit

class Constants {
    //image
    static func getCellImage(index: Int) -> UIImage? {
        switch index {
        case 0:
            return UIImage(systemName: Pictures.name.rawValue)
        case 1:
            return UIImage(systemName: Pictures.surname.rawValue)
        case 2:
            return UIImage(systemName: Pictures.theModelOfCar.rawValue)
        case 3:
            return UIImage(systemName: Pictures.numberOfTheCar.rawValue)
        default:
            return UIImage(systemName: Pictures.job
                            .rawValue)
        }
    }
}
