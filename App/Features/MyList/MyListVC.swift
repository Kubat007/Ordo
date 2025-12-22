import UIKit

final class MyListVC: BaseVC<MyListCV, MyListVM> {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Test MyListVC")
        contentView.backgroundColor = .purple
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBackAction), for: .touchUpInside)
    }
}

@objc extension MyListVC {
    func onBackAction() {
        viewModel.onBackAction?()
    }
}
