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
		NavigationView {
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
					}.onDelete(perform: self.deleteItems)
				}
				
				Section {
					HStack {
						Text("Total: ")
							.font(.headline)
						Spacer()
						Text("$\(order.total)")
					}
				}
				
				NavigationLink("Place Order", destination: PaymentView())
					.padding(10)
					.background(.blue)
					.foregroundColor(.white)
					.cornerRadius(5)
					.disabled(order.items.isEmpty)
				
			}
			.navigationBarTitle(Text("Order"))
			.toolbar {
				EditButton()
			}
			.navigationBarTitleDisplayMode(.inline)
		}
		
	}
	
	func deleteItems(atOffSet offSet: IndexSet) {
		guard let index = offSet.first else { return }
		let value = order.items.keys.sorted(by: >)[index]
		order.items[value] = nil
	}
}

struct OrderDetail_Previews: PreviewProvider {
	static var previews: some View {
		OrderDetail().environmentObject(Order(items: [example: 3]))
	}
}
