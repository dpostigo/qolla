//
// Created by Daniela Postigo on 3/23/18.
//

import Foundation

extension Collection {
    @discardableResult
    public func first(handler: (Element) -> Void) -> Self {
        if let first = self.first { handler(first) }
        return self
    }
    
    @discardableResult
    public func some(handler: () -> Void) -> Self {
        if !self.isEmpty { handler() }; return self
    }
    
    @discardableResult
    public func empty(handler: () -> Void) -> Self {
        if self.isEmpty { handler() }; return self
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


