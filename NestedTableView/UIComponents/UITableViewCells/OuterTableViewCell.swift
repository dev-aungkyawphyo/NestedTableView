//
//  OuterTableViewCell.swift
//  NestedTableView
//
//  Created by Aung Kyaw Phyo on 05/11/2024.
//

import UIKit

class OuterTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var verticalLineView: UIView!
    @IBOutlet weak var horizontalLineView: UIView!
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
   
    @IBOutlet weak var innerTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var paddingView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
