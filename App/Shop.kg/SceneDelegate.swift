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
        private var apiServices: ApiServices!
        private var appCoordinator: AppCoordinator!

        func scene(_ scene: UIScene,
                   willConnectTo session: UISceneSession,
                   options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
            setupServices()
            setupWindow(with: windowScene)
            startAppCoordinator()
            FontFamily.registerAllCustomFonts()
        }
        
        private func setupServices() {
            let client = makeClient()
            let mainRepository = MainRemoteRepository(client: client)
            let authRepository = AuthRemoteRepository(client: client)
            
            apiServices = ApiServicesImpl(
                repository: ( 
                    auth: authRepository,
                    main: mainRepository
                ),
                client: client,
                appSettingsManager: AppSettingsManager()
            )
        }
        
        private func setupWindow(with windowScene: UIWindowScene) {
            window = UIWindow(windowScene: windowScene)
            window?.backgroundColor = .systemBackground
            window?.makeKeyAndVisible()
        }
            
        private func startAppCoordinator() {
            let rootController = BaseNC()
            window?.rootViewController = rootController
            
            let router = AppRouter(rootController: rootController)
            appCoordinator = AppCoordinator(router: router, services: apiServices) // 👈 и здесь
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

//    private func makeClient(with session: Session) -> HTTPClient {
        private func makeClient() -> HTTPClient {
            let baseURL = URL(string: "http://167.99.133.138")!
            let client = HTTPClient(baseURL: baseURL)
        client.headers = HTTPHeaders(arrayLiteral:
                .init(name: "DeviceId", value: deviceID ?? ""),
                .init(name: "OS", value: OS),
                .init(name: "Version", value: systemVersion),
                .init(name: "Source", value: deviceName),
                .init(name: "Model", value: deviceModel.rawValue),
                .init(name: "Brand", value: deviceBrand)
//                .init(name: "Language", value: getLanguage())
        )
//        client.headers.set(.authorization, Defaults[.credentials].bearerToken())
        
//        let responseMessageValidator = ResponseMessageValidator()
        let responseLogValidator = ResponseLogValidator()
//        let refreshTokenValidator = RefreshTokenValidator(client: client)
        
//        let authValidator = HTTPAltRequestValidator(statusCodes: [.unauthorized]) { request, response in
            // If triggered here you'll specify the alt call to execute in order to refresh a JWT session token
            // before any retry of the initial failed request.
//            var silentLogin = AuthAPI.RefreshIdToken(refreshToken: Defaults[.credentials].refreshToken)
//            return silentLogin.request()
//        } onReceiveAltResponse: { request, response in
            // Once you have received response from your `refreshToken` call
            // you can do anything you need to use it.
            // In this example we'll set the global client's authorization header.
//            let accessToken = try response.decode(BaseModel<AuthModels.Response.AccessToken>.self)
//            Defaults[.credentials] = accessToken.data
//            client.headers.set(.authorization, "Bearer \(accessToken.data.accessToken)")
//        }

//        refreshTokenValidator.handlerLogOut = { [weak self] in
//            guard let self = self else { return }
//            DispatchQueue.main.async {
//                guard let appCoordinator = self.appCoordinator as? AppCoordinator else { return }
//                appCoordinator.start()
//            }
//        }
        
        // append at the top of the validators chain
//        client.validators.insert(authValidator, at: 0)
//        client.validators.insert(refreshTokenValidator, at: 0)
//        client.validators.append(responseLogValidator)
//        client.validators.append(responseMessageValidator)
        return client
    }
}
