import Foundation
import ComposableArchitecture
#if os(macOS)
import Sparkle
#else
#endif
import SwiftUI

// MARK: - State

public struct AppDelegateState: Equatable {
    public var shouldAutoUpdate = true
    public var shouldHandleUserActivity = true
    
    public init(
        shouldAutoUpdate: Bool = true,
        shouldHandleUserActivity: Bool = true
    ) {
        self.shouldAutoUpdate = shouldAutoUpdate
        self.shouldHandleUserActivity = shouldHandleUserActivity
    }
}

// MARK: - Action

public enum AppDelegateAction: Equatable {
    case willFinishLaunching
    case didFinishLaunching
    case continueActivity(NSUserActivity)
}

// MARK: - Environment

public struct AppDelegateEnvironment: Equatable {
    #if os(macOS)
    public var updater = SPUStandardUpdaterController(
        updaterDelegate: nil,
        userDriverDelegate: nil
    )
    #endif
    
    public init() {}
}

// MARK: - Reducer

public let appDelegateReducer = Reducer<AppDelegateState, AppDelegateAction, AppDelegateEnvironment> { state, action, environment in
    switch action {
        case .willFinishLaunching:
            #if os(macOS)
            NSWindow.allowsAutomaticWindowTabbing = false
            #endif
            return .none
        case .didFinishLaunching:
            #if os(macOS)
            if state.shouldAutoUpdate {
                environment.updater.startUpdater()
            }
            #endif
            return .none
        case .continueActivity(activity):
            print("did handle activity \(activity)")
            return .none
    }
}
