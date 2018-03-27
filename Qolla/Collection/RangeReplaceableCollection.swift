//
// Created by Daniela Postigo on 3/23/18.
//

import Foundation

extension RangeReplaceableCollection  {
    public static func +(lhs: Self, rhs: Element) -> Self { return lhs + [rhs] }
    public static func +=(lhs: inout Self, rhs: Self.Element) { lhs += [rhs] }
}


extension RangeReplaceableCollection where Element: Equatable {

    public static func -<S: Sequence>(lhs: Self, rhs: S) -> Self where S.Element == Element {
        return lhs.filter { !rhs.contains($0) }
    }
    
    public static func -(lhs: Self, rhs: Element) -> Self { return lhs - [rhs] }
    public static func -=(lhs: inout Self, rhs: Self.Element) { lhs = lhs - [rhs] }
    
}
