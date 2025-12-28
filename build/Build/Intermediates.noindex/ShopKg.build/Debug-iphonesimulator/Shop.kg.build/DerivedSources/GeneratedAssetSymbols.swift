import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "Colors" asset catalog resource namespace.
    enum Colors {

        /// The "Colors/121212" asset catalog color resource.
        static let _121212 = DeveloperToolsSupport.ColorResource(name: "Colors/121212", bundle: resourceBundle)

        /// The "Colors/232837" asset catalog color resource.
        static let _232837 = DeveloperToolsSupport.ColorResource(name: "Colors/232837", bundle: resourceBundle)

        /// The "Colors/292929" asset catalog color resource.
        static let _292929 = DeveloperToolsSupport.ColorResource(name: "Colors/292929", bundle: resourceBundle)

        /// The "Colors/292C38" asset catalog color resource.
        static let _292_C_38 = DeveloperToolsSupport.ColorResource(name: "Colors/292C38", bundle: resourceBundle)

        /// The "Colors/2B3041" asset catalog color resource.
        static let _2_B_3041 = DeveloperToolsSupport.ColorResource(name: "Colors/2B3041", bundle: resourceBundle)

        /// The "Colors/2E3446" asset catalog color resource.
        static let _2_E_3446 = DeveloperToolsSupport.ColorResource(name: "Colors/2E3446", bundle: resourceBundle)

        /// The "Colors/2F3445" asset catalog color resource.
        static let _2_F_3445 = DeveloperToolsSupport.ColorResource(name: "Colors/2F3445", bundle: resourceBundle)

        /// The "Colors/34394D" asset catalog color resource.
        static let _34394_D = DeveloperToolsSupport.ColorResource(name: "Colors/34394D", bundle: resourceBundle)

        /// The "Colors/343A4E" asset catalog color resource.
        static let _343_A_4_E = DeveloperToolsSupport.ColorResource(name: "Colors/343A4E", bundle: resourceBundle)

        /// The "Colors/373F56" asset catalog color resource.
        static let _373_F_56 = DeveloperToolsSupport.ColorResource(name: "Colors/373F56", bundle: resourceBundle)

        /// The "Colors/3B75E7" asset catalog color resource.
        static let _3_B_75_E_7 = DeveloperToolsSupport.ColorResource(name: "Colors/3B75E7", bundle: resourceBundle)

        /// The "Colors/3F455B" asset catalog color resource.
        static let _3_F_455_B = DeveloperToolsSupport.ColorResource(name: "Colors/3F455B", bundle: resourceBundle)

        /// The "Colors/45B26B" asset catalog color resource.
        static let _45_B_26_B = DeveloperToolsSupport.ColorResource(name: "Colors/45B26B", bundle: resourceBundle)

        /// The "Colors/494949" asset catalog color resource.
        static let _494949 = DeveloperToolsSupport.ColorResource(name: "Colors/494949", bundle: resourceBundle)

        /// The "Colors/4986FF" asset catalog color resource.
        static let _4986_FF = DeveloperToolsSupport.ColorResource(name: "Colors/4986FF", bundle: resourceBundle)

        /// The "Colors/4AB3FF" asset catalog color resource.
        static let _4_AB_3_FF = DeveloperToolsSupport.ColorResource(name: "Colors/4AB3FF", bundle: resourceBundle)

        /// The "Colors/4F576E" asset catalog color resource.
        static let _4_F_576_E = DeveloperToolsSupport.ColorResource(name: "Colors/4F576E", bundle: resourceBundle)

        /// The "Colors/65676D" asset catalog color resource.
        static let _65676_D = DeveloperToolsSupport.ColorResource(name: "Colors/65676D", bundle: resourceBundle)

        /// The "Colors/75D38F" asset catalog color resource.
        static let _75_D_38_F = DeveloperToolsSupport.ColorResource(name: "Colors/75D38F", bundle: resourceBundle)

        /// The "Colors/808191" asset catalog color resource.
        static let _808191 = DeveloperToolsSupport.ColorResource(name: "Colors/808191", bundle: resourceBundle)

        /// The "Colors/909090" asset catalog color resource.
        static let _909090 = DeveloperToolsSupport.ColorResource(name: "Colors/909090", bundle: resourceBundle)

        /// The "Colors/A2D8FF" asset catalog color resource.
        static let A_2_D_8_FF = DeveloperToolsSupport.ColorResource(name: "Colors/A2D8FF", bundle: resourceBundle)

        /// The "Colors/A4A6AC" asset catalog color resource.
        static let A_4_A_6_AC = DeveloperToolsSupport.ColorResource(name: "Colors/A4A6AC", bundle: resourceBundle)

        /// The "Colors/B0B0B0" asset catalog color resource.
        static let B_0_B_0_B_0 = DeveloperToolsSupport.ColorResource(name: "Colors/B0B0B0", bundle: resourceBundle)

        /// The "Colors/B1AFC6" asset catalog color resource.
        static let B_1_AFC_6 = DeveloperToolsSupport.ColorResource(name: "Colors/B1AFC6", bundle: resourceBundle)

        /// The "Colors/B7B7B7" asset catalog color resource.
        static let B_7_B_7_B_7 = DeveloperToolsSupport.ColorResource(name: "Colors/B7B7B7", bundle: resourceBundle)

        /// The "Colors/CE9D2E" asset catalog color resource.
        static let CE_9_D_2_E = DeveloperToolsSupport.ColorResource(name: "Colors/CE9D2E", bundle: resourceBundle)

        /// The "Colors/D1D2D5" asset catalog color resource.
        static let D_1_D_2_D_5 = DeveloperToolsSupport.ColorResource(name: "Colors/D1D2D5", bundle: resourceBundle)

        /// The "Colors/D1D3D9" asset catalog color resource.
        static let D_1_D_3_D_9 = DeveloperToolsSupport.ColorResource(name: "Colors/D1D3D9", bundle: resourceBundle)

        /// The "Colors/D6D3EB" asset catalog color resource.
        static let D_6_D_3_EB = DeveloperToolsSupport.ColorResource(name: "Colors/D6D3EB", bundle: resourceBundle)

        /// The "Colors/DCAC00" asset catalog color resource.
        static let DCAC_00 = DeveloperToolsSupport.ColorResource(name: "Colors/DCAC00", bundle: resourceBundle)

        /// The "Colors/E1E1E1" asset catalog color resource.
        static let E_1_E_1_E_1 = DeveloperToolsSupport.ColorResource(name: "Colors/E1E1E1", bundle: resourceBundle)

        /// The "Colors/E4E4E4" asset catalog color resource.
        static let E_4_E_4_E_4 = DeveloperToolsSupport.ColorResource(name: "Colors/E4E4E4", bundle: resourceBundle)

        /// The "Colors/E4E4EF" asset catalog color resource.
        static let E_4_E_4_EF = DeveloperToolsSupport.ColorResource(name: "Colors/E4E4EF", bundle: resourceBundle)

        /// The "Colors/E5E5E5" asset catalog color resource.
        static let E_5_E_5_E_5 = DeveloperToolsSupport.ColorResource(name: "Colors/E5E5E5", bundle: resourceBundle)

        /// The "Colors/E5E7E9" asset catalog color resource.
        static let E_5_E_7_E_9 = DeveloperToolsSupport.ColorResource(name: "Colors/E5E7E9", bundle: resourceBundle)

        /// The "Colors/ECEAFB" asset catalog color resource.
        static let ECEAFB = DeveloperToolsSupport.ColorResource(name: "Colors/ECEAFB", bundle: resourceBundle)

        /// The "Colors/F3F3F3" asset catalog color resource.
        static let F_3_F_3_F_3 = DeveloperToolsSupport.ColorResource(name: "Colors/F3F3F3", bundle: resourceBundle)

        /// The "Colors/F4F4F4" asset catalog color resource.
        static let F_4_F_4_F_4 = DeveloperToolsSupport.ColorResource(name: "Colors/F4F4F4", bundle: resourceBundle)

        /// The "Colors/F5F5F5" asset catalog color resource.
        static let F_5_F_5_F_5 = DeveloperToolsSupport.ColorResource(name: "Colors/F5F5F5", bundle: resourceBundle)

        /// The "Colors/F7F7FE" asset catalog color resource.
        static let F_7_F_7_FE = DeveloperToolsSupport.ColorResource(name: "Colors/F7F7FE", bundle: resourceBundle)

        /// The "Colors/FE1D00" asset catalog color resource.
        static let FE_1_D_00 = DeveloperToolsSupport.ColorResource(name: "Colors/FE1D00", bundle: resourceBundle)

        /// The "Colors/FF6767" asset catalog color resource.
        static let FF_6767 = DeveloperToolsSupport.ColorResource(name: "Colors/FF6767", bundle: resourceBundle)

        /// The "Colors/FFE05D" asset catalog color resource.
        static let FFE_05_D = DeveloperToolsSupport.ColorResource(name: "Colors/FFE05D", bundle: resourceBundle)

        /// The "Colors/FFFFFF" asset catalog color resource.
        static let FFFFFF = DeveloperToolsSupport.ColorResource(name: "Colors/FFFFFF", bundle: resourceBundle)

        /// The "Colors/black" asset catalog color resource.
        static let black = DeveloperToolsSupport.ColorResource(name: "Colors/black", bundle: resourceBundle)

        /// The "Colors/c50000" asset catalog color resource.
        static let c50000 = DeveloperToolsSupport.ColorResource(name: "Colors/c50000", bundle: resourceBundle)

        /// The "Colors/error" asset catalog color resource.
        static let error = DeveloperToolsSupport.ColorResource(name: "Colors/error", bundle: resourceBundle)

        /// The "Colors/success" asset catalog color resource.
        static let success = DeveloperToolsSupport.ColorResource(name: "Colors/success", bundle: resourceBundle)

        /// The "Colors/warning" asset catalog color resource.
        static let warning = DeveloperToolsSupport.ColorResource(name: "Colors/warning", bundle: resourceBundle)

        /// The "Colors/white" asset catalog color resource.
        static let white = DeveloperToolsSupport.ColorResource(name: "Colors/white", bundle: resourceBundle)

    }

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "Images" asset catalog resource namespace.
    enum Images {

        /// The "Images/add_list_ic" asset catalog image resource.
        static let addListIc = DeveloperToolsSupport.ImageResource(name: "Images/add_list_ic", bundle: resourceBundle)

        /// The "Images/basket_ic" asset catalog image resource.
        static let basketIc = DeveloperToolsSupport.ImageResource(name: "Images/basket_ic", bundle: resourceBundle)

        /// The "Images/emtyList" asset catalog image resource.
        static let emtyList = DeveloperToolsSupport.ImageResource(name: "Images/emtyList", bundle: resourceBundle)

        /// The "Images/eye" asset catalog image resource.
        static let eye = DeveloperToolsSupport.ImageResource(name: "Images/eye", bundle: resourceBundle)

        /// The "Images/eye_hidden" asset catalog image resource.
        static let eyeHidden = DeveloperToolsSupport.ImageResource(name: "Images/eye_hidden", bundle: resourceBundle)

        /// The "Images/ic_transfer_kg" asset catalog image resource.
        static let icTransferKg = DeveloperToolsSupport.ImageResource(name: "Images/ic_transfer_kg", bundle: resourceBundle)

        /// The "Images/nav_back_button" asset catalog image resource.
        static let navBackButton = DeveloperToolsSupport.ImageResource(name: "Images/nav_back_button", bundle: resourceBundle)

        /// The "Images/ordo_logo" asset catalog image resource.
        static let ordoLogo = DeveloperToolsSupport.ImageResource(name: "Images/ordo_logo", bundle: resourceBundle)

        /// The "Images/patent_done_ic" asset catalog image resource.
        static let patentDoneIc = DeveloperToolsSupport.ImageResource(name: "Images/patent_done_ic", bundle: resourceBundle)

        /// The "Images/search_ic_grey" asset catalog image resource.
        static let searchIcGrey = DeveloperToolsSupport.ImageResource(name: "Images/search_ic_grey", bundle: resourceBundle)

        /// The "Images/toast_error" asset catalog image resource.
        static let toastError = DeveloperToolsSupport.ImageResource(name: "Images/toast_error", bundle: resourceBundle)

        /// The "Images/toast_success" asset catalog image resource.
        static let toastSuccess = DeveloperToolsSupport.ImageResource(name: "Images/toast_success", bundle: resourceBundle)

    }

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "Colors" asset catalog resource namespace.
    enum Colors {

        /// The "Colors/121212" asset catalog color.
        static var _121212: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._121212)
#else
            .init()
#endif
        }

        /// The "Colors/232837" asset catalog color.
        static var _232837: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._232837)
#else
            .init()
#endif
        }

        /// The "Colors/292929" asset catalog color.
        static var _292929: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._292929)
#else
            .init()
#endif
        }

        /// The "Colors/292C38" asset catalog color.
        static var _292_C_38: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._292_C_38)
#else
            .init()
#endif
        }

        /// The "Colors/2B3041" asset catalog color.
        static var _2_B_3041: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._2_B_3041)
#else
            .init()
#endif
        }

        /// The "Colors/2E3446" asset catalog color.
        static var _2_E_3446: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._2_E_3446)
#else
            .init()
#endif
        }

        /// The "Colors/2F3445" asset catalog color.
        static var _2_F_3445: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._2_F_3445)
#else
            .init()
#endif
        }

        /// The "Colors/34394D" asset catalog color.
        static var _34394_D: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._34394_D)
#else
            .init()
#endif
        }

        /// The "Colors/343A4E" asset catalog color.
        static var _343_A_4_E: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._343_A_4_E)
#else
            .init()
#endif
        }

        /// The "Colors/373F56" asset catalog color.
        static var _373_F_56: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._373_F_56)
#else
            .init()
#endif
        }

        /// The "Colors/3B75E7" asset catalog color.
        static var _3_B_75_E_7: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._3_B_75_E_7)
#else
            .init()
#endif
        }

        /// The "Colors/3F455B" asset catalog color.
        static var _3_F_455_B: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._3_F_455_B)
#else
            .init()
#endif
        }

        /// The "Colors/45B26B" asset catalog color.
        static var _45_B_26_B: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._45_B_26_B)
#else
            .init()
#endif
        }

        /// The "Colors/494949" asset catalog color.
        static var _494949: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._494949)
#else
            .init()
#endif
        }

        /// The "Colors/4986FF" asset catalog color.
        static var _4986_FF: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._4986_FF)
#else
            .init()
#endif
        }

        /// The "Colors/4AB3FF" asset catalog color.
        static var _4_AB_3_FF: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._4_AB_3_FF)
#else
            .init()
#endif
        }

        /// The "Colors/4F576E" asset catalog color.
        static var _4_F_576_E: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._4_F_576_E)
#else
            .init()
#endif
        }

        /// The "Colors/65676D" asset catalog color.
        static var _65676_D: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._65676_D)
#else
            .init()
#endif
        }

        /// The "Colors/75D38F" asset catalog color.
        static var _75_D_38_F: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._75_D_38_F)
#else
            .init()
#endif
        }

        /// The "Colors/808191" asset catalog color.
        static var _808191: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._808191)
#else
            .init()
#endif
        }

        /// The "Colors/909090" asset catalog color.
        static var _909090: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors._909090)
#else
            .init()
#endif
        }

        /// The "Colors/A2D8FF" asset catalog color.
        static var A_2_D_8_FF: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.A_2_D_8_FF)
#else
            .init()
#endif
        }

        /// The "Colors/A4A6AC" asset catalog color.
        static var A_4_A_6_AC: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.A_4_A_6_AC)
#else
            .init()
#endif
        }

        /// The "Colors/B0B0B0" asset catalog color.
        static var B_0_B_0_B_0: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.B_0_B_0_B_0)
#else
            .init()
#endif
        }

        /// The "Colors/B1AFC6" asset catalog color.
        static var B_1_AFC_6: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.B_1_AFC_6)
#else
            .init()
#endif
        }

        /// The "Colors/B7B7B7" asset catalog color.
        static var B_7_B_7_B_7: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.B_7_B_7_B_7)
#else
            .init()
#endif
        }

        /// The "Colors/CE9D2E" asset catalog color.
        static var CE_9_D_2_E: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.CE_9_D_2_E)
#else
            .init()
#endif
        }

        /// The "Colors/D1D2D5" asset catalog color.
        static var D_1_D_2_D_5: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.D_1_D_2_D_5)
#else
            .init()
#endif
        }

        /// The "Colors/D1D3D9" asset catalog color.
        static var D_1_D_3_D_9: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.D_1_D_3_D_9)
#else
            .init()
#endif
        }

        /// The "Colors/D6D3EB" asset catalog color.
        static var D_6_D_3_EB: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.D_6_D_3_EB)
#else
            .init()
#endif
        }

        /// The "Colors/DCAC00" asset catalog color.
        static var DCAC_00: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.DCAC_00)
#else
            .init()
#endif
        }

        /// The "Colors/E1E1E1" asset catalog color.
        static var E_1_E_1_E_1: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.E_1_E_1_E_1)
#else
            .init()
#endif
        }

        /// The "Colors/E4E4E4" asset catalog color.
        static var E_4_E_4_E_4: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.E_4_E_4_E_4)
#else
            .init()
#endif
        }

        /// The "Colors/E4E4EF" asset catalog color.
        static var E_4_E_4_EF: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.E_4_E_4_EF)
#else
            .init()
#endif
        }

        /// The "Colors/E5E5E5" asset catalog color.
        static var E_5_E_5_E_5: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.E_5_E_5_E_5)
#else
            .init()
#endif
        }

        /// The "Colors/E5E7E9" asset catalog color.
        static var E_5_E_7_E_9: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.E_5_E_7_E_9)
#else
            .init()
#endif
        }

        /// The "Colors/ECEAFB" asset catalog color.
        static var ECEAFB: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.ECEAFB)
#else
            .init()
#endif
        }

        /// The "Colors/F3F3F3" asset catalog color.
        static var F_3_F_3_F_3: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.F_3_F_3_F_3)
#else
            .init()
#endif
        }

        /// The "Colors/F4F4F4" asset catalog color.
        static var F_4_F_4_F_4: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.F_4_F_4_F_4)
#else
            .init()
#endif
        }

        /// The "Colors/F5F5F5" asset catalog color.
        static var F_5_F_5_F_5: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.F_5_F_5_F_5)
#else
            .init()
#endif
        }

        /// The "Colors/F7F7FE" asset catalog color.
        static var F_7_F_7_FE: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.F_7_F_7_FE)
#else
            .init()
#endif
        }

        /// The "Colors/FE1D00" asset catalog color.
        static var FE_1_D_00: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.FE_1_D_00)
#else
            .init()
#endif
        }

        /// The "Colors/FF6767" asset catalog color.
        static var FF_6767: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.FF_6767)
#else
            .init()
#endif
        }

        /// The "Colors/FFE05D" asset catalog color.
        static var FFE_05_D: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.FFE_05_D)
#else
            .init()
#endif
        }

        /// The "Colors/FFFFFF" asset catalog color.
        static var FFFFFF: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.FFFFFF)
#else
            .init()
#endif
        }

        /// The "Colors/black" asset catalog color.
        static var black: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.black)
#else
            .init()
#endif
        }

        /// The "Colors/c50000" asset catalog color.
        static var c50000: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.c50000)
#else
            .init()
#endif
        }

        /// The "Colors/error" asset catalog color.
        static var error: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.error)
#else
            .init()
#endif
        }

        /// The "Colors/success" asset catalog color.
        static var success: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.success)
#else
            .init()
#endif
        }

        /// The "Colors/warning" asset catalog color.
        static var warning: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.warning)
#else
            .init()
#endif
        }

        /// The "Colors/white" asset catalog color.
        static var white: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Colors.white)
#else
            .init()
#endif
        }

    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "Colors" asset catalog resource namespace.
    enum Colors {

        /// The "Colors/121212" asset catalog color.
        static var _121212: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._121212)
#else
            .init()
#endif
        }

        /// The "Colors/232837" asset catalog color.
        static var _232837: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._232837)
#else
            .init()
#endif
        }

        /// The "Colors/292929" asset catalog color.
        static var _292929: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._292929)
#else
            .init()
#endif
        }

        /// The "Colors/292C38" asset catalog color.
        static var _292_C_38: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._292_C_38)
#else
            .init()
#endif
        }

        /// The "Colors/2B3041" asset catalog color.
        static var _2_B_3041: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._2_B_3041)
#else
            .init()
#endif
        }

        /// The "Colors/2E3446" asset catalog color.
        static var _2_E_3446: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._2_E_3446)
#else
            .init()
#endif
        }

        /// The "Colors/2F3445" asset catalog color.
        static var _2_F_3445: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._2_F_3445)
#else
            .init()
#endif
        }

        /// The "Colors/34394D" asset catalog color.
        static var _34394_D: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._34394_D)
#else
            .init()
#endif
        }

        /// The "Colors/343A4E" asset catalog color.
        static var _343_A_4_E: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._343_A_4_E)
#else
            .init()
#endif
        }

        /// The "Colors/373F56" asset catalog color.
        static var _373_F_56: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._373_F_56)
#else
            .init()
#endif
        }

        /// The "Colors/3B75E7" asset catalog color.
        static var _3_B_75_E_7: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._3_B_75_E_7)
#else
            .init()
#endif
        }

        /// The "Colors/3F455B" asset catalog color.
        static var _3_F_455_B: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._3_F_455_B)
#else
            .init()
#endif
        }

        /// The "Colors/45B26B" asset catalog color.
        static var _45_B_26_B: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._45_B_26_B)
#else
            .init()
#endif
        }

        /// The "Colors/494949" asset catalog color.
        static var _494949: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._494949)
#else
            .init()
#endif
        }

        /// The "Colors/4986FF" asset catalog color.
        static var _4986_FF: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._4986_FF)
#else
            .init()
#endif
        }

        /// The "Colors/4AB3FF" asset catalog color.
        static var _4_AB_3_FF: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._4_AB_3_FF)
#else
            .init()
#endif
        }

        /// The "Colors/4F576E" asset catalog color.
        static var _4_F_576_E: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._4_F_576_E)
#else
            .init()
#endif
        }

        /// The "Colors/65676D" asset catalog color.
        static var _65676_D: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._65676_D)
#else
            .init()
#endif
        }

        /// The "Colors/75D38F" asset catalog color.
        static var _75_D_38_F: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._75_D_38_F)
#else
            .init()
#endif
        }

        /// The "Colors/808191" asset catalog color.
        static var _808191: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._808191)
#else
            .init()
#endif
        }

        /// The "Colors/909090" asset catalog color.
        static var _909090: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors._909090)
#else
            .init()
#endif
        }

        /// The "Colors/A2D8FF" asset catalog color.
        static var A_2_D_8_FF: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.A_2_D_8_FF)
#else
            .init()
#endif
        }

        /// The "Colors/A4A6AC" asset catalog color.
        static var A_4_A_6_AC: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.A_4_A_6_AC)
#else
            .init()
#endif
        }

        /// The "Colors/B0B0B0" asset catalog color.
        static var B_0_B_0_B_0: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.B_0_B_0_B_0)
#else
            .init()
#endif
        }

        /// The "Colors/B1AFC6" asset catalog color.
        static var B_1_AFC_6: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.B_1_AFC_6)
#else
            .init()
#endif
        }

        /// The "Colors/B7B7B7" asset catalog color.
        static var B_7_B_7_B_7: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.B_7_B_7_B_7)
#else
            .init()
#endif
        }

        /// The "Colors/CE9D2E" asset catalog color.
        static var CE_9_D_2_E: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.CE_9_D_2_E)
#else
            .init()
#endif
        }

        /// The "Colors/D1D2D5" asset catalog color.
        static var D_1_D_2_D_5: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.D_1_D_2_D_5)
#else
            .init()
#endif
        }

        /// The "Colors/D1D3D9" asset catalog color.
        static var D_1_D_3_D_9: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.D_1_D_3_D_9)
#else
            .init()
#endif
        }

        /// The "Colors/D6D3EB" asset catalog color.
        static var D_6_D_3_EB: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.D_6_D_3_EB)
#else
            .init()
#endif
        }

        /// The "Colors/DCAC00" asset catalog color.
        static var DCAC_00: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.DCAC_00)
#else
            .init()
#endif
        }

        /// The "Colors/E1E1E1" asset catalog color.
        static var E_1_E_1_E_1: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.E_1_E_1_E_1)
#else
            .init()
#endif
        }

        /// The "Colors/E4E4E4" asset catalog color.
        static var E_4_E_4_E_4: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.E_4_E_4_E_4)
#else
            .init()
#endif
        }

        /// The "Colors/E4E4EF" asset catalog color.
        static var E_4_E_4_EF: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.E_4_E_4_EF)
#else
            .init()
#endif
        }

        /// The "Colors/E5E5E5" asset catalog color.
        static var E_5_E_5_E_5: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.E_5_E_5_E_5)
#else
            .init()
#endif
        }

        /// The "Colors/E5E7E9" asset catalog color.
        static var E_5_E_7_E_9: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.E_5_E_7_E_9)
#else
            .init()
#endif
        }

        /// The "Colors/ECEAFB" asset catalog color.
        static var ECEAFB: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.ECEAFB)
#else
            .init()
#endif
        }

        /// The "Colors/F3F3F3" asset catalog color.
        static var F_3_F_3_F_3: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.F_3_F_3_F_3)
#else
            .init()
#endif
        }

        /// The "Colors/F4F4F4" asset catalog color.
        static var F_4_F_4_F_4: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.F_4_F_4_F_4)
#else
            .init()
#endif
        }

        /// The "Colors/F5F5F5" asset catalog color.
        static var F_5_F_5_F_5: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.F_5_F_5_F_5)
#else
            .init()
#endif
        }

        /// The "Colors/F7F7FE" asset catalog color.
        static var F_7_F_7_FE: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.F_7_F_7_FE)
#else
            .init()
#endif
        }

        /// The "Colors/FE1D00" asset catalog color.
        static var FE_1_D_00: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.FE_1_D_00)
#else
            .init()
#endif
        }

        /// The "Colors/FF6767" asset catalog color.
        static var FF_6767: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.FF_6767)
#else
            .init()
#endif
        }

        /// The "Colors/FFE05D" asset catalog color.
        static var FFE_05_D: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.FFE_05_D)
#else
            .init()
#endif
        }

        /// The "Colors/FFFFFF" asset catalog color.
        static var FFFFFF: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.FFFFFF)
#else
            .init()
#endif
        }

        /// The "Colors/black" asset catalog color.
        static var black: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.black)
#else
            .init()
#endif
        }

        /// The "Colors/c50000" asset catalog color.
        static var c50000: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.c50000)
#else
            .init()
#endif
        }

        /// The "Colors/error" asset catalog color.
        static var error: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.error)
#else
            .init()
#endif
        }

        /// The "Colors/success" asset catalog color.
        static var success: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.success)
#else
            .init()
#endif
        }

        /// The "Colors/warning" asset catalog color.
        static var warning: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.warning)
#else
            .init()
#endif
        }

        /// The "Colors/white" asset catalog color.
        static var white: UIKit.UIColor {
#if !os(watchOS)
            .init(resource: .Colors.white)
#else
            .init()
#endif
        }

    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "Colors" asset catalog resource namespace.
    enum Colors {

        /// The "Colors/121212" asset catalog color.
        static var _121212: SwiftUI.Color { .init(.Colors._121212) }

        /// The "Colors/232837" asset catalog color.
        static var _232837: SwiftUI.Color { .init(.Colors._232837) }

        /// The "Colors/292929" asset catalog color.
        static var _292929: SwiftUI.Color { .init(.Colors._292929) }

        /// The "Colors/292C38" asset catalog color.
        static var _292_C_38: SwiftUI.Color { .init(.Colors._292_C_38) }

        /// The "Colors/2B3041" asset catalog color.
        static var _2_B_3041: SwiftUI.Color { .init(.Colors._2_B_3041) }

        /// The "Colors/2E3446" asset catalog color.
        static var _2_E_3446: SwiftUI.Color { .init(.Colors._2_E_3446) }

        /// The "Colors/2F3445" asset catalog color.
        static var _2_F_3445: SwiftUI.Color { .init(.Colors._2_F_3445) }

        /// The "Colors/34394D" asset catalog color.
        static var _34394_D: SwiftUI.Color { .init(.Colors._34394_D) }

        /// The "Colors/343A4E" asset catalog color.
        static var _343_A_4_E: SwiftUI.Color { .init(.Colors._343_A_4_E) }

        /// The "Colors/373F56" asset catalog color.
        static var _373_F_56: SwiftUI.Color { .init(.Colors._373_F_56) }

        /// The "Colors/3B75E7" asset catalog color.
        static var _3_B_75_E_7: SwiftUI.Color { .init(.Colors._3_B_75_E_7) }

        /// The "Colors/3F455B" asset catalog color.
        static var _3_F_455_B: SwiftUI.Color { .init(.Colors._3_F_455_B) }

        /// The "Colors/45B26B" asset catalog color.
        static var _45_B_26_B: SwiftUI.Color { .init(.Colors._45_B_26_B) }

        /// The "Colors/494949" asset catalog color.
        static var _494949: SwiftUI.Color { .init(.Colors._494949) }

        /// The "Colors/4986FF" asset catalog color.
        static var _4986_FF: SwiftUI.Color { .init(.Colors._4986_FF) }

        /// The "Colors/4AB3FF" asset catalog color.
        static var _4_AB_3_FF: SwiftUI.Color { .init(.Colors._4_AB_3_FF) }

        /// The "Colors/4F576E" asset catalog color.
        static var _4_F_576_E: SwiftUI.Color { .init(.Colors._4_F_576_E) }

        /// The "Colors/65676D" asset catalog color.
        static var _65676_D: SwiftUI.Color { .init(.Colors._65676_D) }

        /// The "Colors/75D38F" asset catalog color.
        static var _75_D_38_F: SwiftUI.Color { .init(.Colors._75_D_38_F) }

        /// The "Colors/808191" asset catalog color.
        static var _808191: SwiftUI.Color { .init(.Colors._808191) }

        /// The "Colors/909090" asset catalog color.
        static var _909090: SwiftUI.Color { .init(.Colors._909090) }

        /// The "Colors/A2D8FF" asset catalog color.
        static var A_2_D_8_FF: SwiftUI.Color { .init(.Colors.A_2_D_8_FF) }

        /// The "Colors/A4A6AC" asset catalog color.
        static var A_4_A_6_AC: SwiftUI.Color { .init(.Colors.A_4_A_6_AC) }

        /// The "Colors/B0B0B0" asset catalog color.
        static var B_0_B_0_B_0: SwiftUI.Color { .init(.Colors.B_0_B_0_B_0) }

        /// The "Colors/B1AFC6" asset catalog color.
        static var B_1_AFC_6: SwiftUI.Color { .init(.Colors.B_1_AFC_6) }

        /// The "Colors/B7B7B7" asset catalog color.
        static var B_7_B_7_B_7: SwiftUI.Color { .init(.Colors.B_7_B_7_B_7) }

        /// The "Colors/CE9D2E" asset catalog color.
        static var CE_9_D_2_E: SwiftUI.Color { .init(.Colors.CE_9_D_2_E) }

        /// The "Colors/D1D2D5" asset catalog color.
        static var D_1_D_2_D_5: SwiftUI.Color { .init(.Colors.D_1_D_2_D_5) }

        /// The "Colors/D1D3D9" asset catalog color.
        static var D_1_D_3_D_9: SwiftUI.Color { .init(.Colors.D_1_D_3_D_9) }

        /// The "Colors/D6D3EB" asset catalog color.
        static var D_6_D_3_EB: SwiftUI.Color { .init(.Colors.D_6_D_3_EB) }

        /// The "Colors/DCAC00" asset catalog color.
        static var DCAC_00: SwiftUI.Color { .init(.Colors.DCAC_00) }

        /// The "Colors/E1E1E1" asset catalog color.
        static var E_1_E_1_E_1: SwiftUI.Color { .init(.Colors.E_1_E_1_E_1) }

        /// The "Colors/E4E4E4" asset catalog color.
        static var E_4_E_4_E_4: SwiftUI.Color { .init(.Colors.E_4_E_4_E_4) }

        /// The "Colors/E4E4EF" asset catalog color.
        static var E_4_E_4_EF: SwiftUI.Color { .init(.Colors.E_4_E_4_EF) }

        /// The "Colors/E5E5E5" asset catalog color.
        static var E_5_E_5_E_5: SwiftUI.Color { .init(.Colors.E_5_E_5_E_5) }

        /// The "Colors/E5E7E9" asset catalog color.
        static var E_5_E_7_E_9: SwiftUI.Color { .init(.Colors.E_5_E_7_E_9) }

        /// The "Colors/ECEAFB" asset catalog color.
        static var ECEAFB: SwiftUI.Color { .init(.Colors.ECEAFB) }

        /// The "Colors/F3F3F3" asset catalog color.
        static var F_3_F_3_F_3: SwiftUI.Color { .init(.Colors.F_3_F_3_F_3) }

        /// The "Colors/F4F4F4" asset catalog color.
        static var F_4_F_4_F_4: SwiftUI.Color { .init(.Colors.F_4_F_4_F_4) }

        /// The "Colors/F5F5F5" asset catalog color.
        static var F_5_F_5_F_5: SwiftUI.Color { .init(.Colors.F_5_F_5_F_5) }

        /// The "Colors/F7F7FE" asset catalog color.
        static var F_7_F_7_FE: SwiftUI.Color { .init(.Colors.F_7_F_7_FE) }

        /// The "Colors/FE1D00" asset catalog color.
        static var FE_1_D_00: SwiftUI.Color { .init(.Colors.FE_1_D_00) }

        /// The "Colors/FF6767" asset catalog color.
        static var FF_6767: SwiftUI.Color { .init(.Colors.FF_6767) }

        /// The "Colors/FFE05D" asset catalog color.
        static var FFE_05_D: SwiftUI.Color { .init(.Colors.FFE_05_D) }

        /// The "Colors/FFFFFF" asset catalog color.
        static var FFFFFF: SwiftUI.Color { .init(.Colors.FFFFFF) }

        /// The "Colors/black" asset catalog color.
        static var black: SwiftUI.Color { .init(.Colors.black) }

        /// The "Colors/c50000" asset catalog color.
        static var c50000: SwiftUI.Color { .init(.Colors.c50000) }

        /// The "Colors/error" asset catalog color.
        static var error: SwiftUI.Color { .init(.Colors.error) }

        /// The "Colors/success" asset catalog color.
        static var success: SwiftUI.Color { .init(.Colors.success) }

        /// The "Colors/warning" asset catalog color.
        static var warning: SwiftUI.Color { .init(.Colors.warning) }

        /// The "Colors/white" asset catalog color.
        static var white: SwiftUI.Color { .init(.Colors.white) }

    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "Images" asset catalog resource namespace.
    enum Images {

        /// The "Images/add_list_ic" asset catalog image.
        static var addListIc: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.addListIc)
#else
            .init()
#endif
        }

        /// The "Images/basket_ic" asset catalog image.
        static var basketIc: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.basketIc)
#else
            .init()
#endif
        }

        /// The "Images/emtyList" asset catalog image.
        static var emtyList: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.emtyList)
#else
            .init()
#endif
        }

        /// The "Images/eye" asset catalog image.
        static var eye: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.eye)
#else
            .init()
#endif
        }

        /// The "Images/eye_hidden" asset catalog image.
        static var eyeHidden: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.eyeHidden)
#else
            .init()
#endif
        }

        /// The "Images/ic_transfer_kg" asset catalog image.
        static var icTransferKg: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.icTransferKg)
#else
            .init()
#endif
        }

        /// The "Images/nav_back_button" asset catalog image.
        static var navBackButton: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.navBackButton)
#else
            .init()
#endif
        }

        /// The "Images/ordo_logo" asset catalog image.
        static var ordoLogo: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.ordoLogo)
#else
            .init()
#endif
        }

        /// The "Images/patent_done_ic" asset catalog image.
        static var patentDoneIc: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.patentDoneIc)
#else
            .init()
#endif
        }

        /// The "Images/search_ic_grey" asset catalog image.
        static var searchIcGrey: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.searchIcGrey)
#else
            .init()
#endif
        }

        /// The "Images/toast_error" asset catalog image.
        static var toastError: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.toastError)
#else
            .init()
#endif
        }

        /// The "Images/toast_success" asset catalog image.
        static var toastSuccess: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
            .init(resource: .Images.toastSuccess)
#else
            .init()
#endif
        }

    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "Images" asset catalog resource namespace.
    enum Images {

        /// The "Images/add_list_ic" asset catalog image.
        static var addListIc: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.addListIc)
#else
            .init()
#endif
        }

        /// The "Images/basket_ic" asset catalog image.
        static var basketIc: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.basketIc)
#else
            .init()
#endif
        }

        /// The "Images/emtyList" asset catalog image.
        static var emtyList: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.emtyList)
#else
            .init()
#endif
        }

        /// The "Images/eye" asset catalog image.
        static var eye: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.eye)
#else
            .init()
#endif
        }

        /// The "Images/eye_hidden" asset catalog image.
        static var eyeHidden: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.eyeHidden)
#else
            .init()
#endif
        }

        /// The "Images/ic_transfer_kg" asset catalog image.
        static var icTransferKg: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.icTransferKg)
#else
            .init()
#endif
        }

        /// The "Images/nav_back_button" asset catalog image.
        static var navBackButton: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.navBackButton)
#else
            .init()
#endif
        }

        /// The "Images/ordo_logo" asset catalog image.
        static var ordoLogo: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.ordoLogo)
#else
            .init()
#endif
        }

        /// The "Images/patent_done_ic" asset catalog image.
        static var patentDoneIc: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.patentDoneIc)
#else
            .init()
#endif
        }

        /// The "Images/search_ic_grey" asset catalog image.
        static var searchIcGrey: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.searchIcGrey)
#else
            .init()
#endif
        }

        /// The "Images/toast_error" asset catalog image.
        static var toastError: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.toastError)
#else
            .init()
#endif
        }

        /// The "Images/toast_success" asset catalog image.
        static var toastSuccess: UIKit.UIImage {
#if !os(watchOS)
            .init(resource: .Images.toastSuccess)
#else
            .init()
#endif
        }

    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

