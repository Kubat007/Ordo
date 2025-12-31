//
//  NewsVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 30/12/25.
//

import UIKit

final class NewsVC: BaseVC<NewsCV, NewsVM> {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupTableView()
        title = "Новости"
        view.backgroundColor = Asset.Colors.f7F7Fe.color
        viewModel.getNews()
    }

    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        
        contentView.backButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        contentView.backButton.setImage(Asset.Images.navBackButton.image.withRenderingMode(.alwaysTemplate), for: .normal)
        contentView.backButton.tintColor = Asset.Colors.black.color
    }
    
    @objc func onBackAction() {
        viewModel.onBackAction?()
    }
}

extension NewsVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.newsModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTVCell.identifier, for: indexPath) as! NewsTVCell
        cell.configure(with: viewModel.newsModel[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.onNewsDetailAction?(viewModel.newsModel[indexPath.row].id ?? 0)
    }
}

extension NewsVC: NewsVMDelegate {
    func successNews() {
        contentView.tableView.reloadData()
    }
    
    func failure(with error: String) {
        toast(with: error.localized, messageType: .error)
    }
}
