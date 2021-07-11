//
//  DependencyContainer.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.

import Foundation
import Swinject

// swiftlint:disable all
//class ApplicationAssembly: Assembly {
//    func assemble(container: Container) {
//        container.register(DemoAPIProtocol.self, factory: { _ in
//            DemoAPIRepository()
//        }).inObjectScope(.container)
//    }
//}

class DependencyContainer {
    public static let sharedInstance = DependencyContainer()
    private let container = Container()
    
    private func register<T>(service: T.Type, factory: @escaping (Resolver) -> T) {
        container.register(T.self, factory: factory)
    }
    
    func registerServices() {
        register(service: DemoAPIProtocol.self, factory: { _ in
            DemoAPIRepository()
        })
    
    }
    
    func getService<T>() -> T {
        return container.resolve(T.self)!
    }
    
//    let resolver: Resolver = {
//        Assembler([ApplicationAssembly()]).resolver
//    }()

//    func getService<T>() -> T {
//        return resolver.resolve(T.self)!
//    }
}

// swiftlint:enable all
