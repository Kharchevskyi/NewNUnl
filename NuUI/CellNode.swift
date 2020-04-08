//
//  CellNode.swift
//  NuUI
//
//  Created by Anton Kharchevskyi on 08/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit

open class CellNode: ASCellNode {
    public override init() {
        super.init()
        automaticallyManagesSubnodes = true
        selectionStyle = .none
    }
}
