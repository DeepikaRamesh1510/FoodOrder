//
//  Order.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/7/23.
//



import Foundation

class Order: ObservableObject {
	
	@Published var items: [MenuItem: Int] = [:]
	
	init(items: [MenuItem: Int] = [:]) {
		self.items = items
	}
	
	var total: Int {
		items.reduce(0, { return $0 + $1.key.price * $1.value })
	}
	
	func addItem(_ item: MenuItem, count: Int = 1) {
		items[item] = (items[item] ?? 0) + count
	}
	
	func removeItem(_ item: MenuItem, count: Int? = nil) {
		if let count = count {
			items[item] = (items[item] ?? 0) - count
		} else {
			items[item] = nil
		}
	}
	
	func clearOrder() {
		items = [:]
	}
}
