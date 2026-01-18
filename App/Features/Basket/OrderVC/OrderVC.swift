//
//  OrderVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 2/1/26.
//

import UIKit

final class OrderVC: BaseVC<OrderCV, OrderVM> {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        title = "Оформление заказа"
        setupTable()
        viewModel.setup()
    }

    private func setupTable() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.orderButton.addTarget(self, action: #selector(orderAction), for: .touchUpInside)
    }
    
    @objc private func orderAction() {
            print("PAYMENT:", viewModel.selectedPayment)
            print("DELIVERY:", viewModel.selectedDelivery)
            print("LOADER:", viewModel.selectedLoader)
        }
}

extension OrderVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderTVCell.identifier, for: indexPath) as! OrderTVCell
        let model = viewModel.sections[indexPath.section].items[indexPath.row]
        cell.setup(model: model, section: indexPath.section, row: indexPath.row, vm: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? OrderTVCell
        cell?.onSelect?()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TitleSectionHeaderView.reuseIdentifier) as! TitleSectionHeaderView
        switch section {
        case 0: headerView.setupWith(icon: Asset.Images.Order.icAddress.image, title: "Адресс доставки")
        case 1: headerView.setupWith(icon: Asset.Images.Order.icCalendar.image, title: "Дата доставки")
        case 2: headerView.setupWith(icon: nil, title: "Способ оплаты")
        case 3: headerView.setupWith(icon: nil, title: "Способ доставки")
        case 4: headerView.setupWith(icon: Asset.Images.Order.icLoader.image, title: "Услуги грузчика")
        default: ()
        }
        headerView.mainView.backgroundColor = Asset.Colors.f7F7Fe.color
        return headerView
        
//        let label = UILabel()
//        label.text = viewModel.sections[section].title
//        label.font = Typography.semibold14.font
//        label.textColor = .systemGray
//        label.backgroundColor = .clear
//        return label
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        44
    }
}

extension OrderVC: OrderVMDelegate {
    func reload() {
        contentView.updateTotal(viewModel.total)
        contentView.tableView.reloadData()
    }
}
