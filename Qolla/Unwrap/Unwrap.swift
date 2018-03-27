//
// Created by Daniela Postigo on 3/9/18.
//

import Foundation

extension Optional {
    @discardableResult
    public func unwrap(handler: (Wrapped) throws -> Void) rethrows -> Optional<Wrapped> {
        return try self.some(handler: handler)
    }
    
    @discardableResult
    public func some(handler: (Wrapped) throws -> Void) rethrows -> Optional<Wrapped> {
        if case .some(let wrapped) = self { try handler(wrapped) }
        return self
    }
    
    @discardableResult
    public func none(handler: () throws -> Void) rethrows -> Optional<Wrapped> {
        if case .none = self { try handler() }
        return self
    }
}


extension Bool {
    @discardableResult
    public func `true`(handler: () throws -> Void) rethrows  -> Bool {
        if self == true { try handler() }
        return self
    }
    
    @discardableResult
    public func `false`(handler: () throws -> Void) rethrows  -> Bool {
        if self == false { try handler() }
        return self
    }
}

