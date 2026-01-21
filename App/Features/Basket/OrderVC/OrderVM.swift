//
//  OrderVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 2/1/26.
//
import UIKit

enum PaymentType: String {
    case cash = "cash"
    case visa = "card"
}

enum DeliveryType: String {
    case courier = "courier"
    case pickup = "pickup"
}

enum LoaderServiceType {
    case yes
    case no
    
    var boolValue: Bool {
        switch self {
        case .yes: return true
        case .no: return false
        }
    }
}

protocol OrderVMDelegate: AnyObject {
    func reload()
    func successOrder()
    func failure(with error: String)
}

final class OrderVM: BaseVM {
    var services: Services!
    var onBackAction: DefaultNavigationCallback?
    weak var delegate: OrderVMDelegate?
    
    var selectedPayment: PaymentType = .cash
    var selectedDelivery: DeliveryType = .courier
    var selectedLoader: LoaderServiceType = .no
    
    var productsSum: Int = 4600
    var deliveryPrice: Int = 1200
    var loaderPrice: Int = 1300
    
    var total: Int { productsSum + deliveryPrice + (selectedLoader == .yes ? loaderPrice : 0) }
    var selectedDate: Date?
    var enteredAddress: String = ""
    
    var toMain: (()-> Void)?
    var orderModel: CartModel.Response.Order?
    
    @MainActor
    func sendOrder(model: CartModel.Request.OrderRequest) {
        loadingIndicatorState = .loading
        Task {
            do {
                let initialize = try await self.services?.repository.cart.order(model: model)
                self.loadingIndicatorState = .loaded
                self.orderModel = initialize
                delegate?.successOrder()
            } catch {
                self.loadingIndicatorState = .loaded
                delegate?.failure(with: error.localizedDescription)
            }
        }
    }
    
    struct Section {
        let items: [OrderCellModel]
    }
    
    var sections: [Section] = []
    
    func selectPayment(_ type: PaymentType) {
        selectedPayment = type
        delegate?.reload()
    }
    
    func selectDelivery(_ type: DeliveryType) {
        selectedDelivery = type
        delegate?.reload()
    }
    
    func selectLoader(_ type: LoaderServiceType) {
        selectedLoader = type
        delegate?.reload()
    }
    
    func setup() {
        sections = [
            
            Section(
                items: [OrderCellModel(
                    title: "Бишкек, Аламедин-1, №70, кв 39",
                    subtitle: nil,
                    image: nil,
                    showArrow: false,
                    showTextField: true,
                    showTitleLabel: false,
                    showDateButton: false)]
            ),
            
            Section(
                items: [
                    OrderCellModel(
                        title: "В ближайшее время",
                        subtitle: nil,
                        image: nil,
                        showArrow: true,
                        showTextField: false,
                        showTitleLabel: false,
                        showDateButton: true)]
            ),
            
            Section(
                items: [
                    OrderCellModel(
                        title: "Наличными",
                        subtitle: nil,
                        image: Asset.Images.Order.icCash.image,
                        showArrow: false,
                        showTextField: false,
                        showTitleLabel: true,
                        showDateButton: false),
                    OrderCellModel(
                        title: "Картой Visa",
                        subtitle: nil,
                        image: Asset.Images.Order.icVisa.image,
                        showArrow: false,
                        showTextField: false,
                        showTitleLabel: true,
                        showDateButton: false)]
            ),
            
            Section(
                items: [
                    OrderCellModel(
                        title: "Курьером",
                        subtitle: nil,
                        image: Asset.Images.Order.icDelivery.image,
                        showArrow: false,
                        showTextField: false,
                        showTitleLabel: true,
                        showDateButton: false),
                    OrderCellModel(
                        title: "Самовывоз",
                        subtitle: nil,
                        image: Asset.Images.Order.icPickup.image,
                        showArrow: false,
                        showTextField: false,
                        showTitleLabel: true,
                        showDateButton: false)]
            )
        ]
    }
}
