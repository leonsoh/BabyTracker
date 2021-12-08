//
//  HomeTableViewCell.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import UIKit
import Reusable

final class HomeCell: UITableViewCell, NibReusable {
    
    // MARK: - Outlets
    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var model: Category? {
        didSet {
            guard let model = model else {
                return
            }
            
            categoryIcon.image = UIImage(systemName: model.imageName)
            titleLabel.text = model.title
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
