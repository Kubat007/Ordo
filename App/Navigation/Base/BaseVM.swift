import Foundation

enum LoadingState {
    case loading
    case loaded
}

protocol BaseVMDelegate: AnyObject {
    func viewModel(_ viewModel: BaseVM, didUpdateLoadingState state: LoadingState)
}

class BaseVM {
    typealias DefaultNavigationCallback = (() -> Void)
    typealias DefaultNavigationCallbackWithData = ((String) -> Void)
    
    weak var baseDelegate: BaseVMDelegate?
    var loadingIndicatorState: LoadingState = .loaded {
        didSet {
            baseDelegate?.viewModel(self, didUpdateLoadingState: loadingIndicatorState)
        }
    }
}

extension BaseVM {
    func actionsOnError(_ error: NetworkError) {
        loadingIndicatorState = .loaded
    }
    
    func startIndicator() {
        loadingIndicatorState = .loading
    }
    
    func stopIndicator() {
        loadingIndicatorState = .loaded
    }
}
