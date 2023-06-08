//
//  MenuItem.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/7/23.
//



import Foundation


struct MenuItem: Codable, Equatable, Identifiable, Hashable, Comparable {
	let id: String
	let name: String
	let price: Int
	let description: String
	let restrictions: [String]
	let photoCredit: String
	
	var mainImage: String {
		name.replacingOccurrences(of: " ", with: "-").lowercased()
	}
	
	var thumbnailImage: String {
		"\(mainImage)-thumb"
	}
	
	static func ==(_ lhs: MenuItem, _ rhs: MenuItem) -> Bool {
		return lhs.id == rhs.id
	}
	
	static func <(_ lhs: MenuItem, _ rhs: MenuItem) -> Bool {
		return lhs.name < rhs.name
	}
}

#if DEBUG

var example: MenuItem = .init(id: "EDCD038C-036F-4C40-826F-61C88CD84DDD", name: "Maple French Toast", price: 6, description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…", restrictions: ["G", "V"], photoCredit: "Joseph Gonzalez")

#endif
