//
//  ColorNavigationManager.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 20/9/22.
//

import Foundation
import SwiftUI

final class ColorNavigationManager: NavigationManager, ObservableObject {
    /// Diferentes vistas a las que se puede navegar
    /// desde el `NavigationStack` que gestiona este manager
    enum Destination: Hashable, Codable {
        case color(value: Color)
        case image
    }
    
    @Published var navigationPath = NavigationPath()
    
    func presentRandomColor() {
        let colors: [Color] = [
            .red,
            .blue,
            .indigo,
            .mint,
            .orange,
            .green,
            .teal
        ]
        
        let randomIndex = Int.random(in: 0..<colors.count)
        self.navigationPath.append(Destination.color(value: colors[randomIndex]))
    }
    
    func presentImage() {
        self.navigationPath.append(Destination.image)
    }
    
    
}
