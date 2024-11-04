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
    @IBOutlet weak var detailView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
