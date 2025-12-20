import Foundation

open class Observable<T> {
    public typealias Observer = (T, T?) -> Void
    
    private var observers: [Int: (Observer, DispatchQueue?)] = [:]
    private var uniqueID = (0...).makeIterator()
    
    fileprivate var _value: T {
        didSet {
            let newValue = _value
            observers.values.forEach { observer, dispatchQueue in
                notify(observer: observer, queue: dispatchQueue, value: newValue, oldValue: oldValue)
            }
        }
    }
    
    public var value: T {
        get {
            return _value
        }
        
        set {
            _value = newValue
        }
    }
      
    fileprivate var _onDispose: () -> Void
    
    public init(_ value: T, onDispose: @escaping () -> Void = {}) {
        _value = value
        _onDispose = onDispose
    }
    
    public init(wrappedValue: T) {
        _value = wrappedValue
        _onDispose = {}
    }
    
    public func observe(_ queue: DispatchQueue? = nil, _ observer: @escaping Observer) -> Disposable {
        let id = uniqueID.next()!
        
        observers[id] = (observer, queue)
        notify(observer: observer, queue: queue, value: value)
        
        let disposable = Disposable { [weak self] in
            self?.observers[id] = nil
            self?._onDispose()
        }
        
        return disposable
    }
    
    public func removeAllObservers() {
        observers.removeAll()
    }
        
    public func asObservable() -> Observable<T> {
        return self
    }
    
    fileprivate func notify(observer: @escaping Observer, queue: DispatchQueue? = nil, value: T, oldValue: T? = nil) {
        if let queue = queue {
            queue.async {
                observer(value, oldValue)
            }
        } else {
            observer(value, oldValue)
        }
    }
}
