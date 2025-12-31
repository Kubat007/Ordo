//
//  FAQVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 31/12/25.
//

import UIKit

final class FAQVC: BaseVC<FAQCV, FAQVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupTableView()
        title = "FAQ"
        view.backgroundColor = Asset.Colors.f7F7Fe.color
        viewModel.getFAQ()
    }

    private func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self

        contentView.backButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
        contentView.backButton.setImage(
            Asset.Images.navBackButton.image.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        contentView.backButton.tintColor = Asset.Colors._4986Ff.color
    }

    @objc private func onBackAction() {
        viewModel.onBackAction?()
    }
}

extension FAQVC: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.faqModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FAQTVCell.identifier, for: indexPath) as! FAQTVCell
        cell.configure(model: viewModel.faqModel[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.getFAQDetail(faqId: viewModel.faqModel[indexPath.row].id ?? 0)
    }
}

extension FAQVC: FAQVMDelegate {
    func successFAQ() {
        contentView.tableView.reloadData()
    }
    
    func successFAQDetail(model: ProfileModel.Response.FAQModel) {
        let sheet = BottomSheetFAQ()
        sheet.modalPresentationStyle = .overFullScreen
        sheet.configure(
            BottomSheetFAQModel(
                title: model.question ?? "",
                text: model.response ?? ""
            )
        )
        present(sheet, animated: false)
    }

    func failure(with error: String) {
        toast(with: error.localized, messageType: .error)
    }
}
