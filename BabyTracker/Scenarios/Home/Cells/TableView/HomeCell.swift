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
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    
    
    var model: Category? {
        didSet {
            guard let model = model else {
                return
            }
            
            categoryIcon.image = UIImage(systemName: model.imageName)
            durationLabel.text = model.duration
            noteLabel.text = model.note
            frequencyLabel.text = model.frequency
            
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
