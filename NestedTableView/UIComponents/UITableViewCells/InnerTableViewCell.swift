//
//  InnerTableViewCell.swift
//  NestedTableView
//
//  Created by Aung Kyaw Phyo on 05/11/2024.
//

import UIKit

class InnerTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var verticalUpperLineView: UIView!
    @IBOutlet weak var verticalBottomLineView: UIView!
    @IBOutlet weak var detailView: UIView! {
        didSet {
            detailView.layer.cornerRadius = 8
            detailView.layer.borderWidth = 1
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    var studentData: StudentData? = nil {
        didSet {
            nameLabel.attributedText = setAttributeString(title: "Name - ", data: studentData?.name)
            ageLabel.attributedText = setAttributeString(title: "Age - ", data: studentData?.age)
            genderLabel.attributedText = setAttributeString(title: "Gender - ", data: studentData?.gender)
            percentageLabel.attributedText = setAttributeString(title: "Percentage - ", data: studentData?.percentage)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setAttributeString(title: String, data: String? = "") -> NSAttributedString {
        let size: CGFloat = 14
        let titleAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: size, weight: .semibold)]
        let dataAttribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: size, weight: .regular)]
        
        let partOne = NSMutableAttributedString(string: title, attributes: titleAttribute)
        let partTwo = NSMutableAttributedString(string: data!, attributes: dataAttribute)
        
        let combination = NSMutableAttributedString()
        combination.append(partOne)
        combination.append(partTwo)
        return combination
    }

}
