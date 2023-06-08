//
//  ContentView.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/7/23.
//



import SwiftUI

struct ContentView: View {
	
	let menu: [MenuCategory] = {
		let path = Bundle.main.url(forResource: "menu", withExtension: "json")!
		let data = try! Data(contentsOf: path)
		return try! JSONDecoder().decode([MenuCategory].self, from: data)
	}()
	
    var body: some View {
		NavigationView {
			List {
				ForEach(menu) { category in
					Section(category.name) {
						ForEach(category.items) { item in
							NavigationLink {
								ItemDetailView(item: item)
							} label: {
								ItemRow(item: item)
							}
						}
					}
				}
			}.navigationBarTitle(Text("Menu"))
		}
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
