# Ordo Market 🛒

An iOS e-commerce application for a construction materials store. Built as a freelance project for a real client in Bishkek, Kyrgyzstan.

## Screenshots

| Home | Checkout | Order History | Profile |
|------|----------|---------------|---------|
| Categories & product feed | Delivery, payment & porter options | Order tracking with statuses | User profile & settings |

## Features

- 🔐 **Authentication** — secure login & registration
- 🔍 **Smart Search** — fast product search with filters
- 🛍️ **Product Catalog** — categories, product cards, favorites
- 🛒 **Cart & Checkout** — delivery address, date, payment method (cash / Visa), delivery type (courier / pickup), porter service
- 📦 **Order History** — order tracking with statuses (Delivered, In Progress, Paid)
- 🗺️ **Yandex Maps** — integrated map for delivery address selection
- ⚙️ **Settings & Security** — profile management, app settings
- ❤️ **Favorites** — save products for later

## Tech Stack

- **Language:** Swift 5
- **UI:** UIKit (100% programmatic, no Storyboard)
- **Architecture:** MVVM + Coordinator
- **Concurrency:** async/await
- **Networking:** RealHTTP (no Alamofire)
- **Package Manager:** Swift Package Manager (no CocoaPods)
- **Maps:** Yandex MapKit

## Architecture

The app follows **MVVM + Coordinator** pattern:
- `Coordinator` — handles all navigation logic
- `ViewModel` — business logic, data binding
- `ViewController` — only UI rendering, no business logic
- Fully programmatic UI — no `.xib` or `.storyboard` files

## Requirements

- iOS 15.0+
- Xcode 14+
- Swift 5.7+