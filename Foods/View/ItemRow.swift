//
//  ItemRow.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/8/23.
//



import SwiftUI

struct ItemRow: View {
	let item: MenuItem
	let colors: [String: Color] = [
		"D": .purple,
		"G": .black,
		"N": .red,
		"S": .blue,
		"V": .green
	]
	
	var body: some View {
		HStack(alignment: .top, spacing: 10) {
			Image(item.thumbnailImage)
				.clipShape(Circle())
				.overlay(Circle().stroke(.gray, lineWidth: 2))
			VStack(alignment: .leading, spacing: 5) {
				Text(item.name).font(.headline)
				Text("$\(item.price)").font(.caption)
			}
			
			Spacer()
			
			ForEach(item.restrictions, id: \.self) {
				Text($0)
					.font(.caption)
					.padding(5)
					.foregroundColor(.white)
					.background(colors[$0] ?? .black)
					.clipShape(Circle())
			}
		}
	}
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: example)
    }
}
