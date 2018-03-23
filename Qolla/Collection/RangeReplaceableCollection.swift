//
// Created by Daniela Postigo on 3/23/18.
//

import Foundation

extension RangeReplaceableCollection  {
    public static func +(lhs: Self, rhs: Element) -> Self {
        var index = 4
        index = index - 1
        return lhs + [rhs]
    }
    
    public static func +=(lhs: inout Self, rhs: Self.Element) {
        lhs += [rhs]
    }
}


extension RangeReplaceableCollection where Element: Equatable {
    /*
    public static func -(lhs: Self, rhs: Element) -> Self {
        var lhs = lhs
        lhs.index(where: { $0 == rhs}).some { lhs.remove(at: $0) }
        return lhs
    }*/
}
