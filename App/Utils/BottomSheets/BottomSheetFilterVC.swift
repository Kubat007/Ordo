//
//  BottomSheetFilterVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 28/12/25.
//

import UIKit

final class FilterBottomSheetVC: UIViewController {

    private let contentView = FilterBottomSheetCV()
    private var model = FilterBottomSheetModel()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
        enableSwipeDismiss()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.superview?.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
}

private extension FilterBottomSheetVC {

    func setupActions() {

        contentView.categoryButton.addTarget(self, action: #selector(categoryTapped), for: .touchUpInside)
        contentView.dateAscButton.addTarget(self, action: #selector(sortTapped(_:)), for: .touchUpInside)
        contentView.dateDescButton.addTarget(self, action: #selector(sortTapped(_:)), for: .touchUpInside)
        contentView.expensiveButton.addTarget(self, action: #selector(sortTapped(_:)), for: .touchUpInside)
        contentView.cheapButton.addTarget(self, action: #selector(sortTapped(_:)), for: .touchUpInside)

        contentView.currencyButton.addTarget(self, action: #selector(currencyTapped), for: .touchUpInside)
    }

    @objc func categoryTapped() {
        print("Соки и напитки нажато")
    }

    @objc func sortTapped(_ sender: UIButton) {

        let buttons = [
            contentView.dateAscButton,
            contentView.dateDescButton,
            contentView.expensiveButton,
            contentView.cheapButton
        ]

        if sender.isSelected {
            sender.isSelected = false
            sender.setTitleColor(.gray, for: .normal)
            model.sort = nil
            return
        }

        buttons.forEach {
            $0.isSelected = false
            $0.setTitleColor(.gray, for: .normal)
        }

        sender.isSelected = true
        sender.setTitleColor(.systemBlue, for: .normal)

        switch sender {
        case contentView.dateAscButton: model.sort = .dateAsc
        case contentView.dateDescButton: model.sort = .dateDesc
        case contentView.expensiveButton: model.sort = .expensive
        case contentView.cheapButton: model.sort = .cheap
        default: break
        }
    }

    @objc func currencyTapped() {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        Currency.allCases.forEach { cur in
            alert.addAction(UIAlertAction(title: cur.rawValue, style: .default) { _ in
                self.model.currency = cur
                self.contentView.currencyButton.setTitle(cur.rawValue, for: .normal)
            })
        }

        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        present(alert, animated: true)
    }
}

private extension FilterBottomSheetVC {
    func enableSwipeDismiss() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(pan)
    }

    @objc func handlePan(_ g: UIPanGestureRecognizer) {
        let translation = g.translation(in: view)
        if translation.y > 120 {
            dismiss(animated: true)
        }
    }
}
