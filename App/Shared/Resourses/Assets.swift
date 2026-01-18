// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Asset {
    //  public static let accentColor = ColorAsset(name: "AccentColor")
    public enum Colors {
        public static let _121212 = ColorAsset(name: "Colors/121212")
        public static let _232837 = ColorAsset(name: "Colors/232837")
        public static let _292929 = ColorAsset(name: "Colors/292929")
        public static let _292C38 = ColorAsset(name: "Colors/292C38")
        public static let _2B3041 = ColorAsset(name: "Colors/2B3041")
        public static let _2E3446 = ColorAsset(name: "Colors/2E3446")
        public static let _2F3445 = ColorAsset(name: "Colors/2F3445")
        public static let _34394D = ColorAsset(name: "Colors/34394D")
        public static let _343A4E = ColorAsset(name: "Colors/343A4E")
        public static let _373F56 = ColorAsset(name: "Colors/373F56")
        public static let _3B75E7 = ColorAsset(name: "Colors/3B75E7")
        public static let _3F455B = ColorAsset(name: "Colors/3F455B")
        public static let _45B26B = ColorAsset(name: "Colors/45B26B")
        public static let _494949 = ColorAsset(name: "Colors/494949")
        public static let _4986Ff = ColorAsset(name: "Colors/4986FF")
        public static let _4Ab3Ff = ColorAsset(name: "Colors/4AB3FF")
        public static let _4F576E = ColorAsset(name: "Colors/4F576E")
        public static let _65676D = ColorAsset(name: "Colors/65676D")
        public static let _75D38F = ColorAsset(name: "Colors/75D38F")
        public static let _808191 = ColorAsset(name: "Colors/808191")
        public static let _909090 = ColorAsset(name: "Colors/909090")
        public static let a2D8Ff = ColorAsset(name: "Colors/A2D8FF")
        public static let a4A6Ac = ColorAsset(name: "Colors/A4A6AC")
        public static let b0B0B0 = ColorAsset(name: "Colors/B0B0B0")
        public static let b1Afc6 = ColorAsset(name: "Colors/B1AFC6")
        public static let b7B7B7 = ColorAsset(name: "Colors/B7B7B7")
        public static let ce9D2E = ColorAsset(name: "Colors/CE9D2E")
        public static let d1D2D5 = ColorAsset(name: "Colors/D1D2D5")
        public static let d1D3D9 = ColorAsset(name: "Colors/D1D3D9")
        public static let d6D3Eb = ColorAsset(name: "Colors/D6D3EB")
        public static let dcac00 = ColorAsset(name: "Colors/DCAC00")
        public static let e1E1E1 = ColorAsset(name: "Colors/E1E1E1")
        public static let e4E4E4 = ColorAsset(name: "Colors/E4E4E4")
        public static let e4E4Ef = ColorAsset(name: "Colors/E4E4EF")
        public static let e5E5E5 = ColorAsset(name: "Colors/E5E5E5")
        public static let e5E7E9 = ColorAsset(name: "Colors/E5E7E9")
        public static let eceafb = ColorAsset(name: "Colors/ECEAFB")
        public static let f3F3F3 = ColorAsset(name: "Colors/F3F3F3")
        public static let f4F4F4 = ColorAsset(name: "Colors/F4F4F4")
        public static let f5F5F5 = ColorAsset(name: "Colors/F5F5F5")
        public static let f7F7Fe = ColorAsset(name: "Colors/F7F7FE")
        public static let fe1D00 = ColorAsset(name: "Colors/FE1D00")
        public static let ff6767 = ColorAsset(name: "Colors/FF6767")
        public static let ffe05D = ColorAsset(name: "Colors/FFE05D")
        public static let ffffff = ColorAsset(name: "Colors/FFFFFF")
        public static let black = ColorAsset(name: "Colors/black")
        public static let c50000 = ColorAsset(name: "Colors/c50000")
        public static let error = ColorAsset(name: "Colors/error")
        public static let success = ColorAsset(name: "Colors/success")
        public static let warning = ColorAsset(name: "Colors/warning")
        public static let white = ColorAsset(name: "Colors/white")
    }
    public enum Images {
        public enum Disclosure {
            public static let disclosure_left = ImageAsset(name: "Images/Disclosure/disclosure_left")
            public static let disclosure_right = ImageAsset(name: "Images/Disclosure/disclosure_right")
        }
        public enum Order {
            public static let icAddress = ImageAsset(name: "Images/Order/ic_address")
            public static let icCalendar = ImageAsset(name: "Images/Order/ic_calendar")
            public static let icCash = ImageAsset(name: "Images/Order/ic_cash")
            public static let icDelivery = ImageAsset(name: "Images/Order/ic_delivery")
            public static let icLoader = ImageAsset(name: "Images/Order/ic_loader")
            public static let icPickup = ImageAsset(name: "Images/Order/ic_pickup")
            public static let icVisa = ImageAsset(name: "Images/Order/ic_visa")
        }
        public static let eye = ImageAsset(name: "Images/eye")
        public static let eyeHidden = ImageAsset(name: "Images/eye_hidden")
        public static let icTransferKg = ImageAsset(name: "Images/ic_transfer_kg")
        public static let navBackButton = ImageAsset(name: "Images/nav_back_button")
        public static let patentDoneIc = ImageAsset(name: "Images/patent_done_ic")
        public static let searchIcGrey = ImageAsset(name: "Images/search_ic_grey")
        public static let toastError = ImageAsset(name: "Images/toast_error")
        public static let toastSuccess = ImageAsset(name: "Images/toast_success")
        public static let ordoLogo = ImageAsset(name: "Images/ordo_logo")
    }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
    public fileprivate(set) var name: String
    
#if os(macOS)
    public typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
    public typealias Color = UIColor
#endif
    
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    public private(set) lazy var color: Color = {
        guard let color = Color(asset: self) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }()
    
#if os(iOS) || os(tvOS)
    @available(iOS 11.0, tvOS 11.0, *)
    public func color(compatibleWith traitCollection: UITraitCollection) -> Color {
        let bundle = BundleToken.bundle
        guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
            fatalError("Unable to load color asset named \(name).")
        }
        return color
    }
#endif
    
#if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public private(set) lazy var swiftUIColor: SwiftUI.Color = {
        SwiftUI.Color(asset: self)
    }()
#endif
    
    fileprivate init(name: String) {
        self.name = name
    }
}

public extension ColorAsset.Color {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    convenience init?(asset: ColorAsset) {
        let bundle = BundleToken.bundle
#if os(iOS) || os(tvOS)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
#elseif os(macOS)
        self.init(named: NSColor.Name(asset.name), bundle: bundle)
#elseif os(watchOS)
        self.init(named: asset.name)
#endif
    }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Color {
    init(asset: ColorAsset) {
        let bundle = BundleToken.bundle
        self.init(asset.name, bundle: bundle)
    }
}
#endif

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
