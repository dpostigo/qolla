//
// Created by Daniela Postigo on 1/24/18.
//

import Foundation

extension Sequence {
	
	public var array: [Element] {
		return Array(self)
	}
	public func all(_ body: (Self.Element) throws -> Bool) rethrows -> Bool {
		return try self.filter { try body($0) == false }.count > 0
	}
	
	// MARK: Pretty print
	
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
	
	// MARK: Methods
	
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

extension Sequence where Element: Hashable {
	public var unique: [Element] {
		return Set<Element>(self).array
	}
}

extension String {
	fileprivate init?<S: Sequence>(_ object: S, options: JSONSerialization.WritingOptions) {
		do { try self.init(data: JSONSerialization.data(withJSONObject: object, options: options), encoding: .utf8) }
		catch { return nil }
	}
}

