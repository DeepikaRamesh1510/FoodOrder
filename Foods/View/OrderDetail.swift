//
//  OrderDetail.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/8/23.
//



import SwiftUI

struct OrderDetail: View {
	
	@EnvironmentObject var order: Order
	
	var body: some View {
		List {
			Section {
				ForEach(order.items.keys.sorted(by: >), id: \.self) { item in
					HStack {
						Image(item.thumbnailImage)
							.clipShape(Circle())
							.overlay(Circle().stroke(.gray, lineWidth: 2))
						Text(item.name)
						Spacer()
						Text("$\((order.items[item] ?? 0) * item.price)")
					}
				}
			}
			
			Section {
				HStack {
					Text("Total: ")
						.font(.headline)
					Spacer()
					Text("$\(order.total)")
				}
			}
			
			Section {
				HStack {
					Spacer()
					Button {
						NavigationLink("Place order") {
							Text("Check out")
						}
					} label: {
						Text("Buy")
					}
					.padding(10)
					.background(.blue)
					.foregroundColor(.white)
					.cornerRadius(5)
					Spacer()
				}
				
			}.navigationBarTitle(Text("Order"))
		}
	}
}

struct OrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetail().environmentObject(Order(items: [example: 3]))
    }
}
