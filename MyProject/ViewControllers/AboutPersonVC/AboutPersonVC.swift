//
//  AboutPersonVC.swift
//  MyProject
//
//  Created by Yaroslav on 26.12.2021.
//

import UIKit

// MARK: - AboutPersonVC
class AboutPersonVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var personImageView: UIImageView!
    @IBOutlet weak private var personLabel: UILabel!
    
    // MARK: - Properties
    var person: Person!
    var state: AboutPersonVCState!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        state == .name ? setupNameInfo() : setupCarInfo()
    }
}

// MARK: - Extension
private extension AboutPersonVC {
    // Передаем данные персона
    func setupNameInfo() {
        personLabel.text = "\(person.fullName)"
        personImageView.image = UIImage(named: person.fullName)
    }
    // Передаем данные машины
    func setupCarInfo() {
        personLabel.text = "\(person.theModelOfCar)"
        personImageView.image = UIImage(named: person.theModelOfCar)
    }
}
