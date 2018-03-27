//
// Created by Daniela Postigo on 1/19/18.
//

import Foundation

public protocol Autorepresentable: CodingKey, RawRepresentable, Hashable where RawValue == Int { }

extension Autorepresentable {
    
    public typealias Handler = (Self) -> Void
    
    public static func count(_ element: Self) -> [Self] {
        return self.count(element.rawValue + 1)
    }
    
    public static func count(_ count: Int) -> [Self] {
        return count.times.flatMap { self.init(rawValue: $0) }
    }
    
    public static func +=(lhs: inout Self, rhs: Int) {
        lhs = lhs + rhs
    }
    
    public static func +(lhs: Self, rhs: Int) -> Self {
        switch lhs.rawValue + rhs {
            case let value where value < Self.count: return self.init(rawValue: value)!
            default: return Self(0)!
        }
    }
    
    public static var rawValues: [Self.RawValue] {
        return self.all.map { $0.rawValue }
    }
    
}