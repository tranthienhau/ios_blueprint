//
//  DispathQueueExtension.swift
//  blueprint
//
//  Created by DatNguyen on 15/06/2021.
//

import Foundation

private extension DispatchQueue {
    static var workItems = [AnyHashable: DispatchWorkItem]()
    static var weakTargets = NSPointerArray.weakObjects()
    static func debounceIndetifierFor(_ object: AnyObject) -> String {
        return "\(Unmanaged.passUnretained(object).toOpaque())." + String(describing: object)
    }
}

public extension DispatchQueue {
    func asyncDebounce(target: AnyObject,
                       after delay: TimeInterval,
                       execute work: @escaping () -> Void) {
        let debounceIndetifier = DispatchQueue.debounceIndetifierFor(target)
        if let existingWorkItem = DispatchQueue.workItems.removeValue(forKey: debounceIndetifier) {
            existingWorkItem.cancel()
            print("Debounce work item: \(debounceIndetifier)")
        }
        let workItem = DispatchWorkItem {
            DispatchQueue.workItems.removeValue(forKey: debounceIndetifier)
            for item in DispatchQueue.weakTargets.allObjects {
                if debounceIndetifier == DispatchQueue.debounceIndetifierFor(item as AnyObject) {
                    work()
                    print("Debounce Ran work Item: \(debounceIndetifier)")
                    break
                }
            }
        }
        DispatchQueue.workItems[debounceIndetifier] = workItem
        DispatchQueue.weakTargets.addPointer(Unmanaged.passUnretained(target).toOpaque())
        asyncAfter(deadline: .now() + delay, execute: workItem)
    }
}
