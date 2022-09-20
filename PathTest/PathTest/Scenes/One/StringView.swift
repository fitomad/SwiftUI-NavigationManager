//
//  SecondView.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 23/6/22.
//

import SwiftUI

struct StringView: View {
    @EnvironmentObject var coordinator: AppNavigationManager
    
    var stringValue: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image(systemName: "textformat.abc")
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .symbolRenderingMode(.monochrome)
                .foregroundColor(.red)
                .padding(48)
            
            Text(stringValue)
                .font(.body)
                .fontWeight(.bold)
            
            Button(action: { coordinator.presentIntegerView(number: 2_009) }) {
                Text("Ir a la vista IntegerView")
                    .font(.callout)
            }
            
            Button(action: { coordinator.popToRootView() }) {
                Text("Volver a la raíz")
            }
        }
    }
}

struct StringView_Previews: PreviewProvider {
    static var previews: some View {
        StringView(stringValue: "Test")
    }
}
