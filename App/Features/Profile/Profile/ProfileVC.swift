//
//  ProfileVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 22/12/25.
//

import UIKit

final class ProfileVC: BaseVC<ProfileCV, ProfileVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        if AuthManager.shared.isLoggedIn {
            contentView.loginViewBigContainer.isHidden = true
            contentView.tableView.isHidden = false
            contentView.loginViewBigContainer.backgroundColor = Asset.Colors.f7F7Fe.color
        } else {
            contentView.tableView.isHidden = true
            contentView.loginViewBigContainer.isHidden = false
            contentView.loginViewBigContainer.backgroundColor = Asset.Colors.f7F7Fe.color
        }
        viewModel.setupAppearanceCell()
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

extension ProfileVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.appearanceSectionCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        let item = viewModel.appearanceSectionCell[indexPath.row]
        cell.configure(model: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: ()
        case 1: viewModel.onHistoryAction?()
        case 3: viewModel.onNewsAction?()
        case 4: viewModel.onFAQAction?()
        case 5: viewModel.onAboutAppAction?()
        default: ()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0...2: return 68
        default: return 52
        }
    }
}

