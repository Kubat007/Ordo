//
//  SceneDelegate.swift
//  Shop.kg
//
//  Created by Kubat Muktarbek on 20/11/25.
//

import UIKit
import RealHTTP

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var apiServices: Services!
    private var appCoordinator: AppCoordinator!
    
    // Performance tracking
    private var sceneConnectTime: CFAbsoluteTime = 0
    private var windowSetupTime: CFAbsoluteTime = 0
    private var servicesSetupTime: CFAbsoluteTime = 0

        func scene(_ scene: UIScene,
                   willConnectTo session: UISceneSession,
                   options connectionOptions: UIScene.ConnectionOptions) {
            sceneConnectTime = CFAbsoluteTimeGetCurrent()
            print("🚀 [PERFORMANCE] Scene willConnect started")
            
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            let startWindow = CFAbsoluteTimeGetCurrent()
            setupWindow(with: windowScene)
            windowSetupTime = CFAbsoluteTimeGetCurrent() - startWindow
            print("⏱️ [PERFORMANCE] Window setup: \(String(format: "%.3f", windowSetupTime))s")
            
            // Register fonts asynchronously to speed up launch
            let fontStart = CFAbsoluteTimeGetCurrent()
            DispatchQueue.global(qos: .userInitiated).async {
                FontFamily.registerAllCustomFonts()
                let fontTime = CFAbsoluteTimeGetCurrent() - fontStart
                print("🔤 [PERFORMANCE] Fonts registered: \(String(format: "%.3f", fontTime))s (async)")
            }
            
            // Setup services and start coordinator on main thread after window is ready
            DispatchQueue.main.async { [weak self] in
                let servicesStart = CFAbsoluteTimeGetCurrent()
                self?.setupServices()
                self?.servicesSetupTime = CFAbsoluteTimeGetCurrent() - servicesStart
                print("⚙️ [PERFORMANCE] Services setup: \(String(format: "%.3f", self?.servicesSetupTime ?? 0))s")
                
                let coordinatorStart = CFAbsoluteTimeGetCurrent()
                self?.startAppCoordinator()
                let coordinatorTime = CFAbsoluteTimeGetCurrent() - coordinatorStart
                print("🎯 [PERFORMANCE] Coordinator started: \(String(format: "%.3f", coordinatorTime))s")
                
                let totalTime = CFAbsoluteTimeGetCurrent() - (self?.sceneConnectTime ?? 0)
                print("✅ [PERFORMANCE] Total app launch: \(String(format: "%.3f", totalTime))s")
            }
        }
        
        private func setupServices() {
            // Use lazy initialization for better performance
            let client = makeClient()
            
            // Initialize repositories on-demand
            let mainRepository = MainRemoteRepository(client: client)
            let authRepository = AuthRemoteRepository(client: client)
            let cartRepository = CartRemoteRepository(client: client)
            
            apiServices = ApiServicesImpl(
                repository: ( 
                    auth: authRepository,
                    main: mainRepository,
                    cart: cartRepository
                ),
                client: client,
                appSettingsManager: AppSettingsManager()
            )
        }
        
        private func setupWindow(with windowScene: UIWindowScene) {
            window = UIWindow(windowScene: windowScene)
            window?.backgroundColor = .systemBackground
            
            // Show loading indicator while app initializes
            let loadingVC = UIViewController()
            loadingVC.view.backgroundColor = .systemBackground
            
            let activityIndicator = UIActivityIndicatorView(style: .large)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            activityIndicator.startAnimating()
            loadingVC.view.addSubview(activityIndicator)
            
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: loadingVC.view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: loadingVC.view.centerYAnchor)
            ])
            
            window?.rootViewController = loadingVC
            window?.makeKeyAndVisible()
        }
            
        private func startAppCoordinator() {
            let rootController = BaseNC()
            window?.rootViewController = rootController
            
            let router = AppRouter(rootController: rootController)
            let coordinatorFactory = AppCoordinatorFactoryImpl()
            appCoordinator = AppCoordinator(
                        router: router,
                        coordinatorFactory: coordinatorFactory,
                        services: apiServices
                    )
            appCoordinator.start()
        }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }

//    private func makeClient(with session: Session) -> HTTPClient
        private func makeClient() -> HTTPClient {
            let baseURL = URL(string: "http://167.99.133.138")!
            let client = HTTPClient(baseURL: baseURL)
            
            // Optimize: Build headers once
            let deviceId = deviceID ?? ""
            let token = AuthManager.shared.getToken() ?? ""
            
            client.headers = HTTPHeaders(arrayLiteral:
                .init(name: "DeviceId", value: deviceId),
                .init(name: "OS", value: OS),
                .init(name: "Version", value: systemVersion),
                .init(name: "Source", value: deviceName),
                .init(name: "Model", value: deviceModel.rawValue),
                .init(name: "Brand", value: deviceBrand)
            )
            client.headers.set(.authorization, "Token \(token)")
        
            // Add validators if needed
            let responseLogValidator = ResponseLogValidator()
            client.validators.append(responseLogValidator)
            
            return client
        }
}
