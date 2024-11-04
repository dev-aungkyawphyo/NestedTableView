//
//  Extensions.swift
//  NestedTableView
//
//  Created by Aung Kyaw Phyo on 05/11/2024.
//

import Foundation
import UIKit

extension UITableView {
    
    public override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return contentSize
    }
    
    public override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    
}
