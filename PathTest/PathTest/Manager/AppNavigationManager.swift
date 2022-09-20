//
//  NavigationCoordinator.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 23/6/22.
//

import Foundation
import SwiftUI

final class AppNavigationManager: NavigationManager, ObservableObject {
    /// Diferentes vistas a las que se puede navegar
    /// desde el `NavigationStack` que gestiona este manager
    enum Destination: Hashable, Codable {
        case integer(value: Int)
        case string(value: String)
        case parameterless
    }
    
    @Published var navigationPath = NavigationPath()
    
    /**
     Restauramos el estado de la pila de navegación
    */
    init() {
        // Se encuentra comentado por un error que se produce al
        // deserializar el contenido previamente guardado.
        // Parece que es un error recurrente ya comentado en el
        // Apple Developer Forum (FB10718297)
        // https://developer.apple.com/forums/thread/710295
        
        //self.restoreAppState()
    }
    
    func presentIntegerView(number: Int) {
        self.navigationPath.append(Destination.integer(value: number))
    }
    
    func presentStringView(string: String) {
        self.navigationPath.append(Destination.string(value: string))
    }
    
    func presentParameterless() {
        self.navigationPath.append(Destination.parameterless)
    }
    
    /**
        Simula una navegación que se nos solicita desde un deeplink.
    */
    func presentAll() {
        self.presentIntegerView(number: 1)
        self.presentIntegerView(number: 2)
        self.presentStringView(string: "Hola 👋")
        self.presentParameterless()
        self.presentStringView(string: "Hola de nuevo 👋")
    }
}

