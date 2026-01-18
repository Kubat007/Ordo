//
//  OrderVM.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 2/1/26.
//

enum PaymentType {
    case cash
    case visa
}

enum DeliveryType {
    case courier
    case pickup
}

enum LoaderServiceType {
    case yes
    case no
}

protocol OrderVMDelegate: AnyObject {
    func reload()
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
                    showArrow: true)]
            ),
            
            Section(
                items: [
                    OrderCellModel(
                        title: "В ближайшее время",
                        subtitle: nil,
                        image: nil,
                        showArrow: true)]
            ),
            
            Section(
                items: [
                    OrderCellModel(
                        title: "Наличными",
                        subtitle: nil,
                        image: Asset.Images.Order.icCash.image,
                        showArrow: false),
                    OrderCellModel(
                        title: "Картой Visa",
                        subtitle: nil,
                        image: Asset.Images.Order.icVisa.image,
                        showArrow: false)]
            ),
            
            Section(
                items: [
                    OrderCellModel(
                        title: "Курьером",
                        subtitle: nil,
                        image: Asset.Images.Order.icDelivery.image,
                        showArrow: false),
                    OrderCellModel(
                        title: "Самовывоз",
                        subtitle: nil,
                        image: Asset.Images.Order.icPickup.image,
                        showArrow: false)]
            ),
            
            Section(
                items: [
                    OrderCellModel(
                        title: "Да",
                        subtitle: nil,
                        image: nil,
                        showArrow: false),
                    OrderCellModel(
                        title: "Нет",
                        subtitle: "sdkn evkndfv efkvnef verfvfdvsd dsfvdfv rfv dfvdfv dfvdfvv dsfvsdfvrtv sdfbfdv sdfvbsdrt fdvdf",
                        image: nil,
                        showArrow: false)]
            )
        ]
    }
}


//icAddress
//icCalendar
//icCash
//icDelivery
//icLoader
//icPickup
//icVisa
