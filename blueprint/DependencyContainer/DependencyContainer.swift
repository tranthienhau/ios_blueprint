//
//  DependencyContainer.swift
//  blueprint
//
//  Created by DatNguyen on 10/06/2021.

import Swinject
import Foundation

class ApplicationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DemoAPIProtocol.self, factory: { resolver in
            DemoAPIRepository()
        }).inObjectScope(.container)
    }
}

class DependencyContainer {
    
    public static let sharedInstance = DependencyContainer()
    let resolver : Resolver =  {
        return Assembler([ApplicationAssembly()]).resolver
    }()
    
    func getService < T > () -> T {
        return resolver.resolve(T.self)!
    }
}
