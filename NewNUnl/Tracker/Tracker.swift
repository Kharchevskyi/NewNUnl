//
//  Tracker.swift
//  NewNUnl
//
//  Created by Anton Kharchevskyi on 25/03/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import UIKit

protocol TrackerType {
    func trackScroll(with percent: CGFloat)
    func track()
}

struct Tracker: TrackerType {
    func trackScroll(with percent: CGFloat) {
        print("Track scroll \(percent)")
    }

    func track() {
        print("Track")
    }
}
