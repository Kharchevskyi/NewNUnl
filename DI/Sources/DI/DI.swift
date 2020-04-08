import UIKit

public struct DependencyList {
    public init() {
        self.dependencies = [:]
    }

    fileprivate init(dependencies: [String: Any]) {
        self.dependencies = dependencies
    }

    fileprivate let dependencies: [String: Any]

    public func with<T>(type: T.Type, instance: T) -> DependencyList {
        var deps = dependencies
        deps["\(type)"] = instance
        return DependencyList(dependencies: deps)
    }

    public func find<T>(type: T.Type) -> T? {
        return dependencies["\(type)"].flatMap { $0 as? T }
    }
}

public protocol DependencyProvider {
    var dependencyList: DependencyList { get }
}

public func inject<T>(
    type: T.Type,
    responder: UIResponder = UIApplication.shared,
    fallback: @autoclosure () -> (T)
) -> T {
    let target = responder.target(forAction: Selector(("dependencyProvider")), withSender: nil) ??
        UIApplication.shared.target(forAction: Selector(("dependencyProvider")), withSender: nil)

    let provider = target.flatMap { $0 as? DependencyProvider }
    let dependency = provider.flatMap { $0.dependencyList.find(type: type) }

    return dependency ?? fallback()
}
