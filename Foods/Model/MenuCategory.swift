//
//  MenuCategory.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/7/23.
//



import Foundation

struct MenuCategory: Codable, Identifiable {
	let name: String
	let id: String
	let items: [MenuItem]
}
