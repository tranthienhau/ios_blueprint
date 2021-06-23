//
//  DependencyContainer.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.

import Foundation
import Swinject

// swiftlint:disable all
class ApplicationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DemoAPIProtocol.self, factory: { _ in
            DemoAPIRepository()
        }).inObjectScope(.container)
    }
}

class DependencyContainer {
    public static let sharedInstance = DependencyContainer()
    let resolver: Resolver = {
        Assembler([ApplicationAssembly()]).resolver
    }()

    func getService<T>() -> T {
        return resolver.resolve(T.self)!
    }
}

// swiftlint:enable all
