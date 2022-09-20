//
//  EntryPointTwo.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 20/9/22.
//

import SwiftUI

struct EntryPointTwo: View {
    @EnvironmentObject var coordinator: ColorNavigationManager
    
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            Spacer()
            
            Button(action: coordinator.presentRandomColor) {
                Text("Ver un Color")
                    .font(.callout)
            }
            
            Spacer()
            
            Button(action: coordinator.presentImage) {
                Text("Ver una Imagen")
                    .font(.callout)
            }
            
            Spacer()
        }
    }
}

struct EntryPointTwo_Previews: PreviewProvider {
    static var previews: some View {
        EntryPointTwo()
    }
}
