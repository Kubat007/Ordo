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
//    public enum HotButton {
//      public static let mainCreditIc = ImageAsset(name: "Images/HotButton/main_credit_ic")
//      public static let mainPaymentIc = ImageAsset(name: "Images/HotButton/main_payment_ic")
//      public static let mainScannerIc = ImageAsset(name: "Images/HotButton/main_scanner_ic")
//      public static let mainServiceIc = ImageAsset(name: "Images/HotButton/main_service_ic")
//      public static let mainTransferIc = ImageAsset(name: "Images/HotButton/main_transfer_ic")
//    }
//    public enum Intro {
//      public static let onboarding1 = ImageAsset(name: "Images/Intro/onboarding_1")
//      public static let onboarding2 = ImageAsset(name: "Images/Intro/onboarding_2")
//      public static let onboarding3 = ImageAsset(name: "Images/Intro/onboarding_3")
//      public static let onboarding4 = ImageAsset(name: "Images/Intro/onboarding_4")
//      public static let onboarding5 = ImageAsset(name: "Images/Intro/onboarding_5")
//    }
//    public enum PopUpImages {
//      public static let errorImage = ImageAsset(name: "Images/PopUpImages/error_image")
//      public static let incorrectVerficiationCode = ImageAsset(name: "Images/PopUpImages/incorrect_verficiation_code")
//      public static let userNotFound = ImageAsset(name: "Images/PopUpImages/user_not_found")
//    }
//    public enum Tabbar {
//      public static let tab1 = ImageAsset(name: "Images/Tabbar/tab_1")
//      public static let tab1Selected = ImageAsset(name: "Images/Tabbar/tab_1_selected")
//      public static let tab2 = ImageAsset(name: "Images/Tabbar/tab_2")
//      public static let tab2Selected = ImageAsset(name: "Images/Tabbar/tab_2_selected")
//      public static let tab3 = ImageAsset(name: "Images/Tabbar/tab_3")
//      public static let tab3Selected = ImageAsset(name: "Images/Tabbar/tab_3_selected")
//      public static let tab4 = ImageAsset(name: "Images/Tabbar/tab_4")
//      public static let tab4Selected = ImageAsset(name: "Images/Tabbar/tab_4_selected")
//      public static let tab5 = ImageAsset(name: "Images/Tabbar/tab_5")
//      public static let tab5Selected = ImageAsset(name: "Images/Tabbar/tab_5_selected")
//    }
//    public enum UsefulItems {
//      public static let usefulExchangeRate = ImageAsset(name: "Images/UsefulItems/useful_exchange_rate")
//      public static let usefulFees = ImageAsset(name: "Images/UsefulItems/useful_fees")
//      public static let usefulFines = ImageAsset(name: "Images/UsefulItems/useful_fines")
//      public static let usefulFoodDeliver = ImageAsset(name: "Images/UsefulItems/useful_food_deliver")
//      public static let usefulMyhome = ImageAsset(name: "Images/UsefulItems/useful_myhome")
//      public static let usefulPatent = ImageAsset(name: "Images/UsefulItems/useful_patent")
//      public static let usefulSalescard = ImageAsset(name: "Images/UsefulItems/useful_salescard")
//      public static let usefulTulpar = ImageAsset(name: "Images/UsefulItems/useful_tulpar")
//    }
//    public static let euroIc = ImageAsset(name: "Images/euro_ic")
//    public static let kztIc = ImageAsset(name: "Images/kzt_ic")
//    public static let rubIc = ImageAsset(name: "Images/rub_ic")
//    public static let usdIc = ImageAsset(name: "Images/usd_ic")
//    public static let actionIg = ImageAsset(name: "Images/action_ig")
//    public static let actionsCafeImage = ImageAsset(name: "Images/actions_cafe.image")
//    public static let actionsShoppingImage = ImageAsset(name: "Images/actions_shopping_image")
//    public static let addCardIc = ImageAsset(name: "Images/add_card_ic")
//    public static let addMoreCardIc = ImageAsset(name: "Images/add_more_card_ic")
//    public static let addPlusBlackButton = ImageAsset(name: "Images/add_plus_black_button")
//    public static let balanceLogoLarge = ImageAsset(name: "Images/balance_logo_large")
//    public static let balanceLogoYellow = ImageAsset(name: "Images/balance_logo_yellow")
//    public static let banksIc = ImageAsset(name: "Images/banks_ic")
//    public static let blueFavoriteIc = ImageAsset(name: "Images/blue_favorite_ic")
//    public static let blueStarIc = ImageAsset(name: "Images/blue_star_ic")
//    public static let calendarIc = ImageAsset(name: "Images/calendar_ic")
//    public static let cameraMask = ImageAsset(name: "Images/camera_mask")
//    public static let cameraMask2 = ImageAsset(name: "Images/camera_mask_2")
//    public static let captureButton = ImageAsset(name: "Images/capture_button")
//    public static let cardElcardIc = ImageAsset(name: "Images/card_elcard_ic")
//    public static let cardMasterIc = ImageAsset(name: "Images/card_master_ic")
//    public static let cardVisaIc = ImageAsset(name: "Images/card_visa_ic")
//    public static let checBottom = ImageAsset(name: "Images/chec_bottom")
//    public static let checkBoxBlueIc = ImageAsset(name: "Images/check_box_blue_ic")
//    public static let checkBoxEmptyIc = ImageAsset(name: "Images/check_box_empty_ic")
//    public static let checkBoxFullIc = ImageAsset(name: "Images/check_box_full_ic")
//    public static let closeStoryIc = ImageAsset(name: "Images/close_story_ic")
//    public static let contactsIc = ImageAsset(name: "Images/contacts_ic")
//    public static let copyIc = ImageAsset(name: "Images/copy_ic")
//    public static let createPatentIc = ImageAsset(name: "Images/create_patent_ic")
//    public static let cropFaceImage = ImageAsset(name: "Images/crop_face_image")
//    public static let cropFaceImage1 = ImageAsset(name: "Images/crop_face_image_1")
//    public static let disclojureRightDarkIc = ImageAsset(name: "Images/disclojure_right_dark_ic")
//    public static let disclosureDown = ImageAsset(name: "Images/disclosure_down")
//    public static let disclosureRight = ImageAsset(name: "Images/disclosure_right")
//    public static let disclosureRightWhiteIc1 = ImageAsset(name: "Images/disclosure_right_white_ic 1")
//    public static let disclosureRightWhiteIc = ImageAsset(name: "Images/disclosure_right_white_ic")
//    public static let dismissIc = ImageAsset(name: "Images/dismiss_ic")
//    public static let editPhotoIc = ImageAsset(name: "Images/edit_photo_ic")
//    public static let elcartCardIc = ImageAsset(name: "Images/elcart_card_ic")
//    public static let emtyFavoriteImage = ImageAsset(name: "Images/emty_favorite_image")
//    public static let examplePassportBackImage = ImageAsset(name: "Images/example_passport_back_image")
//    public static let examplePassportImage = ImageAsset(name: "Images/example_passport_image")
//    public static let expensesIc = ImageAsset(name: "Images/expenses_ic")
//    public static let eye = ImageAsset(name: "Images/eye")
//    public static let eyeHidden = ImageAsset(name: "Images/eye_hidden")
//    public static let filterIc = ImageAsset(name: "Images/filter_ic")
//    public static let gbPresentImage = ImageAsset(name: "Images/gb_present_image")
//    public static let goldCalendarIc = ImageAsset(name: "Images/gold_calendar-ic")
//    public static let grayFavoriteIc = ImageAsset(name: "Images/gray_favorite-ic")
//    public static let helpBotIc = ImageAsset(name: "Images/help_bot_ic")
//    public static let helpIc = ImageAsset(name: "Images/help_ic")
//    public static let homeSelected = ImageAsset(name: "Images/home_selected")
//    public static let homeUnselected = ImageAsset(name: "Images/home_unselected")
    public static let icTransferKg = ImageAsset(name: "Images/ic_transfer_kg")
//    public static let icTransferUnion = ImageAsset(name: "Images/ic_transfer_union")
//    public static let iconFaceId = ImageAsset(name: "Images/icon_face_id")
//    public static let iconTouchId = ImageAsset(name: "Images/icon_touch_id")
//    public static let identImg = ImageAsset(name: "Images/ident_img")
//    public static let increaseLimitIc = ImageAsset(name: "Images/increaseLimit_ic")
//    public static let ipImg = ImageAsset(name: "Images/ip_img")
//    public static let loginBackground = ImageAsset(name: "Images/login_background")
//    public static let loginRefferralIc = ImageAsset(name: "Images/login_refferral_ic")
//    public enum MainBackgrounds {
//      public static let bgImage1 = ImageAsset(name: "Images/main_backgrounds/bg_image_1")
//      public static let bgImage2 = ImageAsset(name: "Images/main_backgrounds/bg_image_2")
//      public static let bgImage3 = ImageAsset(name: "Images/main_backgrounds/bg_image_3")
//    }
//    public static let mainPageActionIc = ImageAsset(name: "Images/main_page_action_ic")
//    public static let mainPersonIc = ImageAsset(name: "Images/main_person_ic")
//    public static let masterCardIc = ImageAsset(name: "Images/master_card_ic")
//    public static let moreIc = ImageAsset(name: "Images/more_ic")
//    public static let myPatentsIc = ImageAsset(name: "Images/my_patents_ic")
    public static let navBackButton = ImageAsset(name: "Images/nav_back_button")
//    public static let navBarProfile = ImageAsset(name: "Images/nav_bar_profile")
//    public static let needIdentificationImage = ImageAsset(name: "Images/need_identification_image")
//    public static let notificationIc = ImageAsset(name: "Images/notification_ic")
//    public static let optionsIc = ImageAsset(name: "Images/options_ic")
//    public static let optionsVerticalIc = ImageAsset(name: "Images/options_vertical_ic")
//    public static let passcodeRemoveIc = ImageAsset(name: "Images/passcode_remove_ic")
//    public static let passportHorizontalExample = ImageAsset(name: "Images/passport_horizontal_example")
    public static let patentDoneIc = ImageAsset(name: "Images/patent_done_ic")
//    public static let patentEmtyIc = ImageAsset(name: "Images/patent_emty_ic")
//    public static let payNextIc = ImageAsset(name: "Images/pay_next_ic")
//    public static let personIc = ImageAsset(name: "Images/person_ic")
//    public static let qrropperAspectratioFill = ImageAsset(name: "Images/qrropper_aspectratio_fill")
//    public static let qrropperCheckMark = ImageAsset(name: "Images/qrropper_check_mark")
//    public static let qrropperFlipHorizontalFill = ImageAsset(name: "Images/qrropper_flip_horizontal_fill")
//    public static let qrropperRotateRightFill = ImageAsset(name: "Images/qrropper_rotate_right_fill")
//    public static let referralCode = ImageAsset(name: "Images/referral_code")
//    public static let referralCodeImage = ImageAsset(name: "Images/referral_code_image")
//    public static let sampleImage = ImageAsset(name: "Images/sample_image")
//    public static let scanIc = ImageAsset(name: "Images/scan_ic")
//    public static let searchIc = ImageAsset(name: "Images/search_ic")
//    public static let searchIcGrey = ImageAsset(name: "Images/search_ic_grey")
//    public static let settingsIc = ImageAsset(name: "Images/settings_ic")
//    public static let shareIc = ImageAsset(name: "Images/share_ic")
//    public static let stampIc = ImageAsset(name: "Images/stamp_ic")
//    public static let starGoldIc = ImageAsset(name: "Images/star_gold_ic")
//    public static let starIc = ImageAsset(name: "Images/star_ic")
//    public static let succesIc = ImageAsset(name: "Images/succes_ic")
//    public static let takeSelfieImage = ImageAsset(name: "Images/take_selfie_image")
    public static let toastError = ImageAsset(name: "Images/toast_error")
    public static let toastSuccess = ImageAsset(name: "Images/toast_success")
//    public static let topRightViewBg = ImageAsset(name: "Images/top_right_view_bg")
//    public static let transferCountryIc = ImageAsset(name: "Images/transfer_country_ic")
//    public static let transferIc = ImageAsset(name: "Images/transfer_ic")
//    public static let unidentImg = ImageAsset(name: "Images/unident_img")
//    public static let visaCardIc = ImageAsset(name: "Images/visa_card_ic")
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
