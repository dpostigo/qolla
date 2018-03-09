//
// Created by Daniela Postigo on 3/9/18.
//

import Foundation

extension Optional {
    @discardableResult
    public func unwrap(handler: (Wrapped) -> Void) -> Optional<Wrapped> {
        return self.some(handler: handler)
    }
    
    @discardableResult
    public func some(handler: (Wrapped) -> Void) -> Optional<Wrapped> {
        if case .some(let wrapped) = self { handler(wrapped) }
        return self
    }
    
    @discardableResult
    public func none(handler: () -> Void) -> Optional<Wrapped> {
        if case .none = self { handler() }
        return self
    }
}

extension Collection {
    @discardableResult
    public func first(handler: (Element) -> Void) -> Self {
        if let first = self.first { handler(first) }
        return self
    }
   
    @discardableResult
    public func isEmpty(handler: () -> Void) -> Self {
        if self.isEmpty { handler() }
        return self
    }
}

extension BidirectionalCollection {
    @discardableResult
    public func last(handler: (Element) -> Void) -> Self {
        if let last = self.last { handler(last) }
        return self
    }
}

extension Bool {
    @discardableResult
    public func `true`(handler: () -> Void) -> Bool {
        if self == true { handler() }
        return self
    }
    
    @discardableResult
    public func `false`(handler: () -> Void) -> Bool {
        if self == false { handler() }
        return self
    }
}

