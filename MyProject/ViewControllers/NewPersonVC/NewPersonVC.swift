//
//  NewPersonVC.swift
//  MyProject
//
//  Created by Yaroslav on 25.12.2021.
//

import UIKit

protocol NewPersonVCDelegate {
    func savePerson(_ person: Person)
}

// MARK: - NewPersonVC
class NewPersonVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var modelCarTextField: UITextField!
    @IBOutlet weak var numberCarTextField: UITextField!
    @IBOutlet weak var jobTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Properties
    var delegate: NewPersonVCDelegate!
}

// MARK: - Action
extension NewPersonVC {
    // Нажали на кнопку, собрали все данные с ТФ
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        // Создали модель
        let person = Person(name: nameTextField.text ?? "", surname: surnameTextField.text ?? "", theModelOfCar: modelCarTextField.text ?? "", numberOfTheCar: numberCarTextField.text ?? "", job: jobTextField.text ?? "")
        // Передаем модель на первый экран
        delegate.savePerson(person)
        // Переходим обратно на первый экран (метод для show показа)
        // (для модального показа(present) используем метод dismiss)
        navigationController?.popViewController(animated: true)
    }
}
