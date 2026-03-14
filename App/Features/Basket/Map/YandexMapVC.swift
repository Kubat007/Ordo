//
//  YandexMapVC.swift
//  ShopKg
//
//  Created by Kubat Muktarbek on 10/3/26.
//

import UIKit
import YandexMapsMobile
import CoreLocation

final class YandexMapVC: BaseVC<YandexMapCV, YandexMapVM>, YMKLayersGeoObjectTapListener {
    
    private var map: YMKMap!
    private var searchManager: YMKSearchManager!
    private var placemark: YMKPlacemarkMapObject?
    private var mapObjects: YMKMapObjectCollection!
    private let locationManager = CLLocationManager()
    private var searchSession: YMKSearchSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
        setupMap()
        setupActions()
        setupLocationManager()
        setupTextField()
    }
    
    private func setupMap() {
        map = contentView.mapView.mapWindow.map
        mapObjects = map.mapObjects
        let bishkek = YMKPoint(latitude: 42.8746, longitude: 74.5698)
        map.move(
            with: YMKCameraPosition(target: bishkek, zoom: 14, azimuth: 0, tilt: 0),
            animation: YMKAnimation(type: .smooth, duration: 1)
        )
        searchManager = YMKSearchFactory.instance().createSearchManager(with: .combined)
        map.addInputListener(with: self)
        map.addTapListener(with: self)
    }
    
    // MARK: - YMKLayersGeoObjectTapListener
    func onObjectTap(with event: YMKGeoObjectTapEvent) -> Bool {
        let geoObject = event.geoObject
        guard let point = geoObject.geometry.first?.point else { return true }
        let address = geoObject.name ?? "Адрес не найден"
        viewModel.selectedAddress = address
        if let placemark = placemark {
            mapObjects.remove(with: placemark)
        }
        placemark = mapObjects.addPlacemark(with: point)
        return true
    }
    
    private func setupActions() {
        contentView.navigationBar.leftButton.addTarget(self, action: #selector(onBack), for: .touchUpInside)
        contentView.navigationBar.titleLabel.text = "Выберите адрес"
        contentView.locationButton.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        contentView.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func setupTextField() {
        contentView.searchTextField.delegate = self
    }
    
    @objc private func locationButtonTapped() {
        checkLocationAuthorization()
    }
    
    @objc private func searchButtonTapped() {
        performSearch()
    }
    
    private func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            showLocationAlert()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
    private func showLocationAlert() {
        let alert = UIAlertController(
            title: "Геолокация отключена",
            message: "Разрешите доступ к геолокации в настройках",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel))
        alert.addAction(UIAlertAction(title: "Настройки", style: .default) { _ in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url)
            }
        })
        present(alert, animated: true)
    }
    
    private func performSearch() {
            guard let query = contentView.searchTextField.text, !query.isEmpty else { return }
            let options = YMKSearchOptions()
            options.resultPageSize = 10
            searchSession = searchManager.submit(
                withText: query,
                geometry: YMKVisibleRegionUtils.toPolygon(with: map.visibleRegion),
                searchOptions: options,
                responseHandler: { [weak self] response, error in
                    if let error = error {
                        print("❌ Search error: \(error.localizedDescription)")
                        self?.toast(with: "Место не найдено", messageType: .error)
                        return
                    }
                    guard let results = response?.collection.children, !results.isEmpty else {
                        print("❌ No results found")
                        self?.toast(with: "Ничего не найдено", messageType: .error)
                        return
                    }
                    print("✅ Found \(results.count) results")
                    if let firstResult = results.first?.obj {
                        self?.moveToSearchResult(firstResult)
                    }
                }
            )
        }
    
    private func moveToSearchResult(_ geoObject: YMKGeoObject) {
        guard let point = geoObject.geometry.first?.point else { return }
        if let placemark = placemark {
            mapObjects.remove(with: placemark)
        }
        placemark = mapObjects.addPlacemark(with: point)
        map.move(
            with: YMKCameraPosition(target: point, zoom: 16, azimuth: 0, tilt: 0),
            animation: YMKAnimation(type: .smooth, duration: 0.5)
        )
        viewModel.selectedAddress = geoObject.name
    }
    
    @objc private func onBack() {
        viewModel.onBackAction?()
    }
}

// MARK: - YMKMapInputListener
extension YandexMapVC: YMKMapInputListener {
    func onMapTap(with map: YMKMap, point: YMKPoint) {
        if let placemark {
            mapObjects.remove(with: placemark)
        }
        
        placemark = mapObjects.addPlacemark(with: point)
        searchManager.submit(
            with: point,
            zoom: NSNumber(value: map.cameraPosition.zoom),
            searchOptions: YMKSearchOptions(),
            responseHandler: { [weak self] response, error in
                guard let item = response?.collection.children.first?.obj else { return }
                let address = item.name ?? "Адрес не найден"
                DispatchQueue.main.async {
                    self?.viewModel.selectedAddress = address
                    
                    self?.contentView.searchTextField.text = ""
                }
            }
        )
    }
    
    func onMapLongTap(with map: YMKMap, point: YMKPoint) {}
}

// MARK: - CLLocationManagerDelegate
extension YandexMapVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        locationManager.stopUpdatingLocation()
        let point = YMKPoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        map.move(
            with: YMKCameraPosition(target: point, zoom: 16, azimuth: 0, tilt: 0),
            animation: YMKAnimation(type: .smooth, duration: 0.5)
        )
        if let placemark = placemark {
            mapObjects.remove(with: placemark)
        }
        placemark = mapObjects.addPlacemark(with: point)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location error: \(error.localizedDescription)")
    }
}

// MARK: - UITextFieldDelegate
extension YandexMapVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        performSearch()
        return true
    }
}

extension YandexMapVC: YandexMapVMDelegate { }
