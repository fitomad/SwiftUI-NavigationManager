//
//  AppNavigator.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 19/9/22.
//

import Foundation
import SwiftUI

protocol NavigationManager: AnyObject {
    /// Pila de navegación
    var navigationPath: NavigationPath { get set }
    
    var codableFileName: String { get }
    
    /// Guarda el estado de la navegación de al app
    func saveAppCurrentState()
    /// Restaura el estado de navegación de la app
    func restoreAppState()
    
    /// Elimina el archivo donde se almacena el estado
    /// de la navegación
    func removeAppStateFile()
    
    /// Vuelve a la vista raiz de la jerarquía de navegación
    func popToRootView()
}

// MARK: - Protocol default implementations -

extension NavigationManager {
    /// Archivo donde serializamos el estado de la pila de navegación
    private var stateFileURL: URL? {
        guard var basePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        basePath.append(path: self.codableFileName)
        
        return basePath
    }
    
    var codableFileName: String {
        return "app.navigation"
    }
    
    /// Serializamos el estado de la pila de navegación
    func saveAppCurrentState() {
        guard let representation = navigationPath.codable,
              let filePath = self.stateFileURL
        else
        {
            return
        }
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(representation)
            
            try data.write(to: filePath)
        } catch {
           // Gestión del error...
        }
    }
    
    /// Recuperamos el estado de la pila de navegación
    func restoreAppState() {
        guard let filePath = self.stateFileURL,
              let data = try? Data(contentsOf: filePath)
        else
        {
            self.navigationPath = NavigationPath()
            return
        }

        do {
            let representation = try JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data)
            self.navigationPath = NavigationPath(representation)
        } catch {
            self.navigationPath = NavigationPath()
        }
    }
    
    func removeAppStateFile() {
        guard let filePath = self.stateFileURL else {
            return
        }
        
        try? FileManager.default.removeItem(at: filePath)
    }
    
    /// Vuelve a la vista raiz de la jerarquía de navegación
    func popToRootView() {
        self.navigationPath.removeLast(self.navigationPath.count)
    }
}
