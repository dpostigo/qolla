//
// Created by Daniela Postigo on 1/3/18.
//

import Foundation

extension Int {
	public var times: CountableClosedRange<Int> {
		return 0 ... self - 1
	}
	public var half: Int {
		return self / 2
	}
}
