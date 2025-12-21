//
//  Coordinator.swift
//  Shop.kg
//
//  Created by Kubat Muktarbek on 20/11/25.
//

import UIKit

protocol Coordinator: AnyObject {
  func start()
  func start(with option: DeepLinkOption?)
//  func startWith(with service: MainModels.Response.PaymentModel?)
}
