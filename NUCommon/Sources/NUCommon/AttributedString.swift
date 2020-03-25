//
//  Created by Anton Kharchevskyi on 25/03/2020.
//

import UIKit

public extension String {
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
