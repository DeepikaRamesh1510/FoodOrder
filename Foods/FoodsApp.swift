//
//  FoodsApp.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/7/23.
//



import SwiftUI

@main
struct FoodsApp: App {
	
	@StateObject var order: Order = Order()
	
    var body: some Scene {
        WindowGroup {
           MainTabView()
				.environmentObject(order)
        }
    }
}
