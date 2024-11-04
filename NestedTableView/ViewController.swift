//
//  ViewController.swift
//  NestedTableView
//
//  Created by Aung Kyaw Phyo on 05/11/2024.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var outerTableView: UITableView!
    
    var schoolData = [
        SchoolData(schoolName: "Thalun International School", isExpanded: false, studentData: [
            StudentData(name: "Aung Myat", age: "18", gender: "Male", percentage: "85%"),
            StudentData(name: "Kay Kay", age: "17", gender: "Female", percentage: "75%"),
            StudentData(name: "Htun Myat", age: "21", gender: "Male", percentage: "65%"),
            StudentData(name: "Aye Chan", age: "19", gender: "Male", percentage: "90%"),
            StudentData(name: "Yati", age: "18", gender: "Female", percentage: "95%"),
        ]),
        SchoolData(schoolName: "Bahan International Science Academy", isExpanded: false, studentData: [
            StudentData(name: "Zaw Zaw", age: "16", gender: "Male", percentage: "75%"),
            StudentData(name: "Bhone Myat", age: "18", gender: "Male", percentage: "90%"),
            StudentData(name: "Moe Moe", age: "19", gender: "Female", percentage: "85%"),
            StudentData(name: "Htoo Myat", age: "21", gender: "Male", percentage: "80%"),
            StudentData(name: "Myint Myat Aung", age: "19", gender: "Male", percentage: "87%"),
        ]),
        SchoolData(schoolName: "French International School of Yangon", isExpanded: false, studentData: [
            StudentData(name: "Cherry", age: "18", gender: "Female", percentage: "95%"),
            StudentData(name: "Thazin", age: "22", gender: "Female", percentage: "75%"),
            StudentData(name: "Aung Ko", age: "22", gender: "Male", percentage: "80%"),
            StudentData(name: "Honey Cho", age: "16", gender: "Female", percentage: "87%"),
            StudentData(name: "Aung Aung", age: "21", gender: "Male", percentage: "89%"),
        ]),
        SchoolData(schoolName: "Yangon American International School", isExpanded: false, studentData: [
            StudentData(name: "Zaw Myint", age: "22", gender: "Male", percentage: "75%"),
            StudentData(name: "Zaw Latt", age: "21", gender: "Male", percentage: "65%"),
            StudentData(name: "Aye Aye", age: "23", gender: "Female", percentage: "75%"),
            StudentData(name: "Win Win", age: "19", gender: "Female", percentage: "65%"),
            StudentData(name: "Aye Mar", age: "24", gender: "Female", percentage: "85%"),
        ]),
        SchoolData(schoolName: "International School of Myanmar", isExpanded: false, studentData: [
            StudentData(name: "Htoo Htoo", age: "18", gender: "Male", percentage: "95%"),
            StudentData(name: "Cherry Lin", age: "21", gender: "Female", percentage: "90%"),
            StudentData(name: "Lin Lin", age: "19", gender: "Female", percentage: "78%"),
            StudentData(name: "Htoo Zaw", age: "21", gender: "Male", percentage: "77%"),
            StudentData(name: "Kyal Sin", age: "18", gender: "Female", percentage: "80%"),
        ]),
        SchoolData(schoolName: "SIS Myanmar", isExpanded: false, studentData: [
            StudentData(name: "Htet Htet", age: "18", gender: "Female", percentage: "95%"),
            StudentData(name: "Honey Nway", age: "19", gender: "Female", percentage: "89%"),
            StudentData(name: "Su Su", age: "21", gender: "Female", percentage: "80%"),
            StudentData(name: "Lin Myat", age: "19", gender: "Male", percentage: "89%"),
            StudentData(name: "Kaung Kaung", age: "20", gender: "Male", percentage: "85%"),
        ]),
    ]

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    // MARK: Additional Helpers
    private func defaultSetup() {
        tableViewSetup()
    }
    
    private func tableViewSetup() {
        outerTableView.delegate = self
        outerTableView.dataSource = self
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: "OuterTableViewCell", for: indexPath) as? OuterTableViewCell else {
            return UITableViewCell()
        }
        cell.index = indexPath.row
        cell.schoolData = schoolData[indexPath.row]
        cell.delegate = self
        return cell
    }
    
}

extension ViewController: ViewControllerToProtocols {
    
    func heightChanged(index: Int, value: Bool) {
        schoolData[index].isExpanded = value
        outerTableView.performBatchUpdates(nil)
    }
    
}
