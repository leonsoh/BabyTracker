//
//  HomeTableViewCell.swift
//  BabyTracker
//
//  Created by Leon Soh on 7/12/21.
//

import UIKit
import Reusable
import SnapKit

final class HomeCell: UITableViewCell, NibReusable {
    
    // MARK: - Outlets
    lazy var categoryIcon = UIImageView()
    lazy var durationLabel = UILabel()
    lazy var noteLabel = UILabel()
    lazy var frequencyLabel = UILabel()
    lazy var swipeActionsView = UIView()
    

    var model: Category? { //Change to Food?
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
        setupUI()
    }
    
    private func setupUI() {
        setupLabelUI()
        setupIconsUI()
        setupSwipeActionsUI()
        setupStackView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    // MARK: - Setup UI
    private func setupLabelUI() {
        durationLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        noteLabel.font = .systemFont(ofSize: 16, weight: .regular)
        frequencyLabel.font = .systemFont(ofSize: 14, weight: .light)
    }
    
    
    private func setupSwipeActionsUI() {
        swipeActionsView.layer.cornerRadius = 2.5
        swipeActionsView.backgroundColor = .systemBlue
        swipeActionsView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(5)
        }
    }
    
    private func setupIconsUI(){
        categoryIcon.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
    }
    
    private func setupStackView() {
        let stackView = UIStackView()
        let labelStackView = UIStackView()
        
        stackView.axis = NSLayoutConstraint.Axis.horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 25
        
        self.addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(20)
            make.trailing.equalTo(-10)
        }
        
        stackView.addArrangedSubview(categoryIcon)
        stackView.addArrangedSubview(setupLabelStackView(stackView: labelStackView))
        stackView.addArrangedSubview(swipeActionsView)
    }
    
    private func setupLabelStackView(stackView: UIStackView) -> UIStackView {
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        
        stackView.addArrangedSubview(durationLabel)
        stackView.addArrangedSubview(noteLabel)
        stackView.addArrangedSubview(frequencyLabel)
        
        return stackView
    }

}
