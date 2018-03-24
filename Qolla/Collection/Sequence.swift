//
// Created by Daniela Postigo on 1/24/18.
//

import Foundation

extension Sequence {
	public func select(_ find: (Self.Iterator.Element) -> Bool) -> Self.Iterator.Element? {
		var generator = self.makeIterator()
		while let elem = generator.next() {
			if (find(elem)) { return elem }
		}
		return nil
	}
	
	public func element<T>(to elementType: T.Type = T.self) -> T? {
		return self.elements(to: elementType).first
	}
	
	public func elements<T>(to elementType: T.Type = T.self) -> [T] {
		return self.flatMap { $0 as? T }
	}
	
	public func dictionary<V>(_ transform: (Element) throws -> V) rethrows -> [Element: V] {
		return try Dictionary(uniqueKeysWithValues: self.map { try ($0, transform($0)) })
	}
}

extension Sequence {
	public var prettyPrinted: String {
        return self.string(options: .prettyPrinted)!
    }
    
    @available(iOS 11.0, macOS 10.13, *)
	public var prettyPrintSorted: String {
        return self.string(options: [.prettyPrinted, .sortedKeys])!
    }
    
	private func string(options: JSONSerialization.WritingOptions) -> String? {
		return String(self, options: options)
	}
}

extension String {
	fileprivate init?<S: Sequence>(_ object: S, options: JSONSerialization.WritingOptions) {
		do { try self.init(data: JSONSerialization.data(withJSONObject: object, options: options), encoding: .utf8) }
		catch { return nil }
	}
}


extension Array where Element : Equatable {
	@discardableResult
	public mutating func remove(_ element: Iterator.Element) -> Element {
		let index = self.index(of: element)
		return self.remove(at: index!)
	}
	
	public static func -(lhs: [Iterator.Element], rhs: [Iterator.Element]) -> [Iterator.Element] {
		var lhs = lhs
		rhs.forEach { lhs.remove($0) }
		return lhs
	}
}

