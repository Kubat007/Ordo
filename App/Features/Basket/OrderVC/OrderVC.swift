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
        setupTable()
        viewModel.setup()
    }

    private func setupTable() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.navigationBar.titleLabel.text = "Оформление заказа"
        contentView.tableView.sectionHeaderTopPadding = 0
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        contentView.orderButton.addTarget(self, action: #selector(orderAction), for: .touchUpInside)
    }
    
    @objc private func orderAction() {
        let model = CartModel.Request.OrderRequest(address: viewModel.enteredAddress,
                                                    delivery_cost: 1500,
                                                    delivery_date: viewModel.selectedDate?.toStringDateCalendar(),
                                                   delivery_method: viewModel.selectedDelivery.rawValue,
                                                   loader_cost: 400,
                                                   loader_service: viewModel.selectedLoader.boolValue,
                                                   payment_method: viewModel.selectedPayment.rawValue
        )
        viewModel.sendOrder(model: model)
    }
    
    @objc func onBackAction() {
        viewModel.onBackAction?()
    }
}

extension OrderVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
            viewModel.sections.count + 1
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section < viewModel.sections.count {
                return viewModel.sections[section].items.count
            } else {
                return 2
            }
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section < viewModel.sections.count {
                let cell = tableView.dequeueReusableCell(withIdentifier: OrderTVCell.identifier, for: indexPath) as! OrderTVCell
                let model = viewModel.sections[indexPath.section].items[indexPath.row]
                cell.setup(model: model, section: indexPath.section, row: indexPath.row, vm: viewModel)
                cell.delegate = self
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: CargoTVCell.identifier, for: indexPath) as! CargoTVCell
                let title = indexPath.row == 0 ? "Да" : "Нет"
                let model = OrderCellModel(title: title, subtitle: nil, image: nil, showArrow: false, showTextField: false, showTitleLabel: true, showDateButton: false)
                cell.setup(model: model, row: indexPath.row, vm: viewModel)
                return cell
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.section < viewModel.sections.count {
                let cell = tableView.cellForRow(at: indexPath) as? OrderTVCell
                cell?.onSelect?()
            } else {
                let cell = tableView.cellForRow(at: indexPath) as? CargoTVCell
                cell?.onSelect?()
            }
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
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        36
    }
}

extension OrderVC {
    
}

extension OrderVC: OrderVMDelegate {
    func successOrder() {
        viewModel.toMain?()
        toast(with: "Заказ успешно оформлен", messageType: .success)
        print("success to main")
        
    }
    
    func failure(with error: String) {
        toast(with: error.localized, messageType: .error)
    }
    
    func reload() {
        contentView.updateTotal(viewModel.total)
        contentView.tableView.reloadData()
    }
}

extension OrderVC: OrderTVCellDelegate {
    func didEnterAddress(_ address: String) {
        viewModel.enteredAddress = address
    }
    
    func didTapDateButton(cell: OrderTVCell) {
        // Открываем календарь
        let datePickerSheet = DatePickerSheet()
        datePickerSheet.onDateSelected = { [weak self] date in
            // Сохраняем выбранную дату в ViewModel
            self?.viewModel.selectedDate = date
            self?.contentView.tableView.reloadData()
        }
        datePickerSheet.modalPresentationStyle = .overFullScreen
        present(datePickerSheet, animated: false)
    }
}

