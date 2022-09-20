//
//  PathTestApp.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 23/6/22.
//

import SwiftUI


struct PathTestApp: App {
    /// Diferentes estados en los que se puede
    /// encontrar el `Scene`.
    @Environment(\.scenePhase) private var scenePhase
    /// Instancia del NavigationManager
    @StateObject private var coordinator = AppNavigationManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.navigationPath) {
                ContentView()
                    .navigationDestination(for: AppNavigationManager.Destination.self) { destination in
                        switch destination {
                            case .integer(let value):
                                IntegerView(integerValue: value)
                            case .string(let value):
                                StringView(stringValue: value)
                            case .parameterless:
                                ParameterlessView()
                        }
                    }
            }
            .environmentObject(coordinator)
            .onChange(of: scenePhase) { sceneState in
                if sceneState == .background {
                    coordinator.saveAppCurrentState()
                }
            }
        }
    }
}
