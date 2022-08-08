//
//  ViewController.swift
//  MyProject
//
//  Created by Yaroslav on 24.12.2021.
//

import UIKit

// MARK: - PersonsInfoVC
class PersonsInfoVC: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var personsInfoTableView: UITableView!
    
    // MARK: - Properties
     var persons: [Person] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
// MARK: - Private Extension
private extension PersonsInfoVC {
    func setupUI() {
        setupTableView()
    }
    
    func setupTableView() {
        personsInfoTableView.alwaysBounceVertical = false
        personsInfoTableView.delegate = self
        personsInfoTableView.dataSource = self
        personsInfoTableView.register(UINib(nibName: String(describing: PersonsInfoCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PersonsInfoCell.self))
        
        if #available(iOS 15.0, *) {
            self.personsInfoTableView.sectionHeaderTopPadding = 0
        }
    }
    
    func checkViewState(index: Int) -> AboutPersonVCState {
        switch index {
        case 0, 1:
            return .name
        case 2:
            return .car
        default:
            return .noSelected
        }
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension PersonsInfoVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PersonsInfoCell.self), for: indexPath) as! PersonsInfoCell
        let person = persons[indexPath.section]
        let image = Constants.getCellImage(index: indexPath.row)
        
        switch indexPath.row {
        case 0:
            cell.config(with: person.name, image: image, state: .name)
        case 1:
            cell.config(with: person.surname, image: image, state: .name)
        case 2:
            cell.config(with: person.theModelOfCar, image: image, state: .car)
        case 3:
            cell.config(with: person.numberOfTheCar, image: image, state: .noSelected)
        case 4:
            cell.config(with: person.job, image: image, state: .noSelected)
        default: break
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        
        let label = UILabel(frame: CGRect(x: 20, y: 3, width: 200, height: 20))
        label.text = persons[section].fullName
        label.textColor = .white
        
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = persons[indexPath.section]
        let state = checkViewState(index: indexPath.row)
        performSegue(withIdentifier: "aboutPersonSegue", sender: (person, state))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aboutPersonSegue" {
            let aboutPersonVC = segue.destination as! AboutPersonVC
            // Получаем тюпл
            let tuple = sender as? (Person, AboutPersonVCState)
            // Первый элемент тюпла
            aboutPersonVC.person = tuple?.0
            // Второй элемент
            aboutPersonVC.state = tuple?.1
            // Создаем ВК с ТФ
        } else {
            let newPersonVC = segue.destination as! NewPersonVC
            newPersonVC.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = .gray
    }
}

// Подписываем под делегат
extension PersonsInfoVC: NewPersonVCDelegate {
    // Сюда приходит уже целый person
    func savePerson(_ person: Person) {
        // Добавляем персона в любое место списка по индексу
        //(в данном случае первый)
        persons.insert(person, at: 0)
        // Обновляем таблицу. Все методы вызываются еще раз
        personsInfoTableView.reloadData()
    }
}
