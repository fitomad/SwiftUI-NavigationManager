//
//  ContentView.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 23/6/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator: AppNavigationManager
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .padding(48)
            
            Button(action: { coordinator.presentIntegerView(number: 1_900) }) {
                Text("Vista de Integer")
                    .font(.callout)
            }
            
            Button(action: { coordinator.presentStringView(string: "Taráááá") }) {
                Text("Vista de String")
                    .font(.callout)
            }
            
            Button(action: coordinator.presentParameterless) {
                Text("Vista sin parámetros asociados")
                    .font(.callout)
            }
            
            Button(action: coordinator.presentAll) {
                Text("Simulación de un Deeplink")
                    .font(.callout)
            }
        }
        .navigationTitle("Entry Point")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
