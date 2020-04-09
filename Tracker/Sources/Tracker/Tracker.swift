
import UIKit

public protocol TrackerType {
    func trackScroll(with percent: CGFloat)
    func track()
}

public struct Tracker: TrackerType {
    public func trackScroll(with percent: CGFloat) {
        print("Track scroll \(percent)")
    }

    public func track() {
        print("Track")
    }

    public init() { }
}
