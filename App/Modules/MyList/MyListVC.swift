import UIKit

final class MyListVC: BaseVC<MyListCV, MyListVM> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Test MyListVC")
        contentView.backgroundColor = .purple
    }
}
