//
//  ItemDetailView.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/8/23.
//



import SwiftUI

struct ItemDetailView: View {
	
	@EnvironmentObject var order: Order
	let item: MenuItem
	@State var count = 1
	var body: some View {
		VStack {
			Spacer()
			ZStack(alignment: .bottomTrailing) {
				Image(item.mainImage)
					.resizable()
					.scaledToFit()
				Text(item.photoCredit)
					.foregroundColor(.white)
					.background(.black)
					.font(.caption)
			}.padding([.leading, .trailing], 20)
			Text(item.description).padding([.leading, .trailing], 20)
			Spacer()
			HStack {
				Spacer()
				Stepper("No of items : \(count)", value: $count, in: 0...100)
				Spacer()
				Button("Add to basket") {
					order.addItem(item, count: count)
				}
				.buttonStyle(.borderless)
				.padding(10)
				.background(.blue)
				.foregroundColor(.white)
				.cornerRadius(5)
				Spacer()
			}
			.padding(20)
			Spacer()
			
		}.navigationTitle(item.name)
			.navigationBarTitleDisplayMode(.inline)
	}
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
		ItemDetailView(item: example).environmentObject(Order())
    }
}
