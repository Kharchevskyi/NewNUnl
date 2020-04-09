//
//  Helpers.swift
//  Mapper
//
//  Created by Anton Kharchevskyi on 09/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit

extension String {
    func attributed(with fontSize: Int, color: UIColor) -> NSAttributedString {
        NSAttributedString(
            string: self,
            attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: CGFloat(fontSize)),
                NSAttributedString.Key.foregroundColor : color
            ]
        )
    }
}
