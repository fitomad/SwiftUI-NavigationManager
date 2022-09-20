//
//  ImageView.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 20/9/22.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image("Poster")
                .resizable()
                .scaledToFit()
                .cornerRadius(16)
                .padding(16)
                
            Spacer()
            
            NavigationControls()
            
            Spacer()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
