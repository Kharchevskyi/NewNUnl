//
//  Extensions.swift
//  NuUI
//
//  Created by Anton Kharchevskyi on 14/04/2020.
//  Copyright © 2020 Anton Kharchevskyi. All rights reserved.
//

import AsyncDisplayKit

extension ASDisplayNode {
    enum GradientDirection {
        case horizontal
        case vertical
        case adjust(CGPoint, CGPoint)

        var points: (start: CGPoint, end: CGPoint) {
            switch self {
            case .horizontal:
                return (start: .init(x: 0.0, y: 0.5), end: .init(x: 1.0, y: 0.5))
            case .vertical:
                return (start: .init(x: 0.5, y: 0.0), end: .init(x: 0.5, y: 1.0))
            case .adjust(let start, let end):
                return (start: start, end: end)
            }
        }
    }

    func gradientBackgroundColor(_ colors: [CGColor], direction: GradientDirection) {
        DispatchQueue.main.async {
            guard !self.hasGradientLayer else { return }
            self.backgroundColor = .clear
            self.clipsToBounds = true
            let gradient = CAGradientLayer()
            gradient.frame = .init(origin: .zero, size: self.calculatedSize)
            gradient.colors = colors
            gradient.startPoint = direction.points.start
            gradient.endPoint = direction.points.end
            self.layer.insertSublayer(gradient, at: 0)
        }
    }

    var hasGradientLayer: Bool {
        return self.layer
            .sublayers?
            .filter({ $0 is CAGradientLayer })
            .count ?? 0 > 0
    }
}
