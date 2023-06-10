//
//  MainTabView.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/8/23.
//



import SwiftUI

struct MainTabView: View {
    var body: some View {
		TabView {
			ContentView()
				.tabItem {
				Label("Menu", systemImage: "list.dash")
			}
			OrderDetail()
				.tabItem {
					Label("Order", systemImage: "square.and.pencil")
				}
		}
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
		MainTabView().environmentObject(Order())
    }
}
