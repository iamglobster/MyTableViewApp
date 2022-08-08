//
//  PersonsInfoCell.swift
//  MyProject
//
//  Created by Yaroslav on 25.12.2021.
//

import UIKit

// MARK: - PersonsInfoCell
class PersonsInfoCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    // MARK: - Methods
    // Принимаем тeкст, фото и состояние экрана
    func config(with text: String, image: UIImage?, state: AboutPersonVCState) {
        //Проперти. Доступна ли вью для нажатия 
        isUserInteractionEnabled = state != .noSelected
        infoLabel.text = text
        pictureImageView.image = image
    }
}
