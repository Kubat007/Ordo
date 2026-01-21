//
//  HistoryVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

import UIKit
import Foundation

final class HistoryVC: BaseVC<HistoryCV, HistoryVM> {

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.navigationBar.titleLabel.text = "История заказов"
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        viewModel.delegate = self
        setupTable()
        viewModel.getHistory()
    }

    private func setupTable() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.backgroundColor = Asset.Colors.f7F7Fe.color
    }
    
    @objc func onBackAction() {
        viewModel.onBackAction?()
    }
}

extension HistoryVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.orderModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTVCell.identifier, for: indexPath) as! HistoryTVCell
        cell.setup(model: viewModel.orderModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onHistoryDetailAction?(viewModel.orderModel[indexPath.row].id ?? 0)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension HistoryVC: HistoryVMDelegate {
    func successOrders() {
        contentView.tableView.reloadData()
    }

    func failure(with error: String) {
        toast(with: error, messageType: .error)
    }
}
