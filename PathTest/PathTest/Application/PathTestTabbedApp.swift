//
//  PathTestTabbedApp.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 20/9/22.
//

import SwiftUI

@main
struct PathTestTAbbedApp: App {
    /// Diferentes estados en los que se puede
    /// encontrar el `Scene`.
    @Environment(\.scenePhase) private var scenePhase
    
    /// Instancia del NavigationManager
    @StateObject private var managerOne = AppNavigationManager()
    /// Instancia del NavigationManager
    @StateObject private var managerTwo = ColorNavigationManager()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationStack(path: $managerOne.navigationPath) {
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
                .environmentObject(managerOne)
                .onChange(of: scenePhase) { sceneState in
                    if sceneState == .background {
                        managerOne.saveAppCurrentState()
                    }
                }
                .tabItem {
                    Label("Tab ONE", systemImage: "1.circle")
                }
                
                NavigationStack(path: $managerTwo.navigationPath) {
                    EntryPointTwo()
                        .navigationDestination(for: ColorNavigationManager.Destination.self) { destination in
                            switch destination {
                                case .color(let value):
                                    ColorView(color: value)
                                case .image:
                                    ImageView()
                            }
                        }
                }
                .environmentObject(managerTwo)
                .onChange(of: scenePhase) { sceneState in
                    if sceneState == .background {
                        managerTwo.saveAppCurrentState()
                    }
                }
                .tabItem {
                    Label("Tab TWO", systemImage: "2.circle")
                }
            }
        }
    }
}
