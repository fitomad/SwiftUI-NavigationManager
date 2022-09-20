//
//  FirstView.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 23/6/22.
//

import SwiftUI

struct IntegerView: View {
    @EnvironmentObject var coordinator: AppNavigationManager
    
    var integerValue: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(systemName: "number")
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .symbolRenderingMode(.monochrome)
                .foregroundColor(.blue)
                .padding(48)
            
            Text("Mostrando el número \(self.integerValue)")
                .font(.title)
                .padding()
            
            Button(action: { coordinator.presentStringView(string: "Vengo de un número...") }) {
                Text("Ir a la vista StringView")
                    .font(.callout)
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        IntegerView(integerValue: 2_000)
    }
}
