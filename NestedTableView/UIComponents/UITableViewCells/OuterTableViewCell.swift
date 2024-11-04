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
    @IBOutlet weak var stackView: UIStackView! {
        didSet {
            stackView.layer.cornerRadius = 8
            stackView.layer.borderWidth = 1
        }
    }
   
    @IBOutlet weak var innerTableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var paddingView: UIView!

    var index: Int?
    var delegate: ViewControllerToProtocols?
    var schoolData: SchoolData? = nil {
        didSet {
            if let data = schoolData {
                innerTableView.isHidden = !data.isExpanded
                schoolNameLabel.text = data.schoolName
                verticalLineView.isHidden = data.isExpanded ? false : true
                innerTableView.delegate = self
                innerTableView.dataSource = self
                innerTableView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTapEvent()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func addTapEvent() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleAction))
        headerView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func handleAction() {
        guard let isExpanded = schoolData?.isExpanded else { return }
        
        innerTableView.isHidden = isExpanded
        paddingView.isHidden = isExpanded
        verticalLineView.isHidden = isExpanded
        UIView.animate(withDuration: 0.3) {
            self.stackView.setNeedsLayout()
            self.delegate?.heightChanged(index: self.index!, value: !isExpanded)
        }
        schoolData?.isExpanded = !isExpanded
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITableViewDelegate
extension OuterTableViewCell: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension OuterTableViewCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolData?.studentData.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InnerTableViewCell", for: indexPath) as? InnerTableViewCell else {
            return UITableViewCell()
        }
        cell.studentData = schoolData?.studentData[indexPath.row]
        if let dataCount = schoolData?.studentData.count {
            cell.verticalBottomLineView.isHidden = dataCount - 1 == indexPath.row ? true : false
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        tableView.invalidateIntrinsicContentSize()
        tableView.layoutIfNeeded()
    }
    
}
