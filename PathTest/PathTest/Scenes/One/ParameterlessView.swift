//
//  ParameterlessView.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 19/9/22.
//

import SwiftUI

struct ParameterlessView: View {
    @EnvironmentObject private var coordinator: AppNavigationManager
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(systemName: "circle")
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .symbolRenderingMode(.monochrome)
                .foregroundColor(.mint)
                .padding(48)
            
            Text("No estoy asociada a ningún tipo de dato")
                .font(.title)
                .multilineTextAlignment(.center)
            
            Button(action: { coordinator.presentStringView(string: "Vengo de un número...") }) {
                Text("Ir a la vista StringView")
                    .font(.callout)
            }
            
            Button(action: { coordinator.presentIntegerView(number: 2_009) }) {
                Text("Ir a la vista IntegerView")
                    .font(.callout)
            }
            
            Button(action: { coordinator.popToRootView() }) {
                Text("Volver a la ráiz")
            }
        }
    }
}

struct ParameterlessView_Previews: PreviewProvider {
    static var previews: some View {
        ParameterlessView()
    }
}
