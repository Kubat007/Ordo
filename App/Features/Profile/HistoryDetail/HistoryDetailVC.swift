//
//  HistoryDetailVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 20/1/26.
//

import UIKit

final class HistoryDetailVC: BaseVC<HistoryDetailCV, HistoryDetailVM> {
    private let headerView = HistoryDetailHeaderView()
    var id = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.navigationBar.titleLabel.text = "История заказов"
        setupTable()
        viewModel.delegate = self
        viewModel.getHistoryDetail(id: id)
    }

    private func setupTable() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        contentView.repeatButton.addTarget(self, action: #selector(repeatAction), for: .touchUpInside)
        contentView.backgroundColor = Asset.Colors.f7F7Fe.color
        
        contentView.tableView.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 320)
        ])
        contentView.tableView.tableHeaderView = headerView
    }

    @objc private func repeatAction() {
        viewModel.repeatOrder()
    }
    
    @objc func onBackAction() {
        viewModel.onBackAction?()
    }
}

extension HistoryDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryDetailTVCell.identifier, for: indexPath) as! HistoryDetailTVCell
        cell.setup(model: viewModel.model?.items?[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}

extension HistoryDetailVC: HistoryDetailVMDelegate {
    func successOrdersDetail() {
        guard let model = self.viewModel.model else { return }
        self.headerView.configure(model: model)
        self.contentView.tableView.reloadData()
    }
    
    func failure(error: String) {
        toast(with: error.localized, messageType: .error)
    }
}
