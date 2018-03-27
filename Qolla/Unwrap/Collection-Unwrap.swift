//
// Created by Daniela Postigo on 3/23/18.
//

import Foundation

extension Collection {
    @discardableResult
    public func first(handler: (Element) throws -> Void) rethrows -> Self {
        if let first = self.first { try handler(first) }
        return self
    }
    
    @discardableResult
    public func some(handler: (Self) throws -> Void) rethrows -> Self {
        if !self.isEmpty { try handler(self) }; return self
    }
    
    @discardableResult
    public func empty(handler: () throws -> Void) rethrows -> Self {
        if self.isEmpty { try handler() }; return self
    }
    
    @discardableResult
    public func isEmpty(handler: () throws -> Void) rethrows -> Self {
        if self.isEmpty { try handler() }
        return self
    }
}

extension BidirectionalCollection {
    @discardableResult
    public func last(handler: (Element) throws -> Void) rethrows -> Self {
        if let last = self.last { try handler(last) }
        return self
    }
}


