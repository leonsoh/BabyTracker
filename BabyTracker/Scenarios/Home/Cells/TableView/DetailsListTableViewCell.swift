//
//  DetailsListTableViewCell.swift
//  BabyTracker
//
//  Created by Leon Soh on 22/12/21.
//

import UIKit
import Reusable

class DetailsListTableViewCell: UITableViewCell, NibReusable {

    // MARK: - Outlets
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    
    // TODO: - Refactor
    var foodModel: Food? {
        didSet {
            guard let model = foodModel else {
                return
            }
            
            iconView.image = UIImage(systemName: model.imageName ?? "fork.knife.circle")
            durationLabel.text = model.duration
            amountLabel.text = model.note
            
        }
    }
    
    var diaperModel: Diaper? {
        didSet {
            guard let model = diaperModel else {
                return
            }
            
            iconView.image = UIImage(systemName: model.imageName ?? "face.smiling")
            durationLabel.text = model.duration
            amountLabel.text = model.frequency
            
        }
    }
    
    var sleepModel: Sleep? {
        didSet {
            guard let model = sleepModel else {
                return
            }
            
            iconView.image = UIImage(systemName: model.imageName ?? "bed.double.circle")
            durationLabel.text = model.duration
            amountLabel.text = model.frequency
            
        }
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
