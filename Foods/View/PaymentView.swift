//
//  PaymentView.swift
//  Foods
//
//  Created by Deepika Ramesh on 6/8/23.
//



import SwiftUI

struct PaymentView: View {
	
	@EnvironmentObject var order: Order
	@State var paymentType: PaymentType = .cash
	@State var addLoyaltyDetails = false
	@State var loyaltyNumber = ""
	@State var cardNum = ""
	@State var tipAmountType: TipAmountType = .ten
	@State var shouldShowOrderConfirmation = false
	
	var totalPrice: String {
		let value = Double(order.total) + Double(order.total) * (tipAmountType.value / 100)
		return value.formatted(.currency(code: "USD"))
	}
	
	var body: some View {
		Form {
			Section {
				Picker("How do you want to pay?", selection: $paymentType) {
					ForEach(PaymentType.allCases, id: \.self) {
						Text($0.string)
					}
				}
				if paymentType == .creditCard || paymentType == .debitCard {
					TextField("Card number", text: $cardNum)
				}
				Toggle("Add loyalty card", isOn: $addLoyaltyDetails.animation())
				if addLoyaltyDetails {
					TextField("Loyalty card number", text: $loyaltyNumber)
				}
			}
			
			Section("Add a tip?") {
				Picker("Percentage", selection: $tipAmountType) {
					ForEach(TipAmountType.allCases, id: \.self) {
						switch $0 {
							case .custom:
								Text("Custom")
							default:
								Text(String(format: "%.2f", $0.value) + "%")
						}
					}
				}
				
				if case .custom = tipAmountType {
					TextField("Enter custom tip percentage", text: $tipAmountType.customValue)
				}
			}
			
			Section("Total: " + totalPrice) {
				Button("Confirm Order") {
					shouldShowOrderConfirmation.toggle()
				}
			}
		}
		.navigationBarTitle("Payment")
		.navigationBarTitleDisplayMode(.inline)
		.alert("Order Confirmation", isPresented: $shouldShowOrderConfirmation) {
			Button("Ok") {
				shouldShowOrderConfirmation.toggle()
			}
		} message: {
			Text("Your order total: " + totalPrice)
		}

	}
}

struct PaymentView_Previews: PreviewProvider {
	static var previews: some View {
		PaymentView().environmentObject(Order())
	}
}

enum TipAmountType: CaseIterable, Hashable {
	static var allCases: [TipAmountType] = [.ten, .fifteen, .twenty, .twentyFive, .custom(0)]
	
	case ten, fifteen, twenty, twentyFive
	case custom(Double)
	
	var value: Double {
		switch self {
			case .ten:
				return 10
			case .fifteen:
				return 15
			case .twenty:
				return 20
			case .twentyFive:
				return 25
			case .custom(let value):
				return value
		}
	}
	
	init(_ value: Double) {
		switch value {
			case 10:
				self = .ten
			case 15:
				self = .fifteen
			case 20:
				self = .twenty
			case 25:
				self = .twentyFive
			default:
				self = .custom(value)
		}
	}
	
	var customValue: String {
		get {
			return "\(value)"
		}
		
		set {
			self = .custom(Double(newValue) ?? 0)
		}
	}
}

enum PaymentType: CaseIterable {
	case cash, creditCard, debitCard, points
	
	var string: String {
		switch self {
				
			case .cash:
				return "Cash"
			case .creditCard:
				return "Credit Card"
			case .debitCard:
				return "Debit Card"
			case .points:
				return "Points"
		}
	}
	
	init(_ type: String) {
		switch type {
			case "Credit Card":
				self = .creditCard
			case "Debit Card":
				self = .debitCard
			case "Points":
				self = .points
			default:
				self = .cash
		}
	}
}
