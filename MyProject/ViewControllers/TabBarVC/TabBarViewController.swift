//
//  TabBarViewController.swift
//  MyProject
//
//  Created by Yaroslav on 25.12.2021.
//

import Foundation
import UIKit

// MARK: - TabBarViewController
class TabBarViewController: UITabBarController {

    // MARK: - Properties
    let persons = Person.getPerson()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: -  Extension
private extension TabBarViewController {
    func setupUI() {
        setupViewViewController(with: persons)
    }
    
    func setupViewViewController(with persons: [Person]) {
        setupPersonsInfoVC()
        setupAboutMeVC()
    }
    
    func setupPersonsInfoVC() {
        let navigationPersonsInfoVC = viewControllers?.first as! UINavigationController //
        let personsInfoVC = navigationPersonsInfoVC.topViewController as! PersonsInfoVC
        personsInfoVC.persons = persons
    }
    
    func setupAboutMeVC() {
        let navigationAboutMeVC = viewControllers?.last as! UINavigationController //
        let aboutMeVC = navigationAboutMeVC.topViewController as! AboutMeVC
        aboutMeVC.persons = persons
    }
    
    func setupNavigationController() {
        navigationItem.leftBarButtonItem = editButtonItem
    }
}
    
