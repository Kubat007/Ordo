//
//  ProfileVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

final class ProfileVC: BaseVC<ProfileCV, ProfileVM> {
   
    private let items: [(String, String?)] = [
        ("Заказы", "Ближайшие: не ожидается"),
        ("Покупки", "Здесь можно оформить заказ заново"),
        ("Способ оплаты", "Выберите удобный способ оплаты"),
        ("Новости", nil),
        ("FAQ", nil),
        ("Приложение", nil)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if AuthManager.shared.isLoggedIn {
            contentView.loginViewBigContainer.isHidden = true
            contentView.tableView.isHidden = false
            contentView.loginViewBigContainer.backgroundColor = Asset.Colors.f7F7Fe.color
        } else {
            contentView.tableView.isHidden = true
            contentView.loginViewBigContainer.isHidden = false
            contentView.loginViewBigContainer.backgroundColor = Asset.Colors.f7F7Fe.color
        }
        title = "Профиль"
        setupTable()
    }
    
    private func setupTable() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.authButton.addTarget(self, action: #selector(authTapped), for: .touchUpInside)
    }
    
    @objc private func authTapped() {
        viewModel.onAuthAction?()
    }
}

extension ProfileVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        let item = items[indexPath.row]
        cell.configure(title: item.0, subtitle: item.1)
        return cell
    }
}

extension ProfileVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return items[indexPath.row].1 == nil ? 52 : 68
    }
}

