//
//  ColorView.swift
//  PathTest
//
//  Created by Adolfo Vera Blasco on 20/9/22.
//

import SwiftUI

struct ColorView: View {
    var color: Color
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            color
                .aspectRatio(1/1, contentMode: .fit)
                .cornerRadius(16)
                .padding(24)
            
            Spacer()
            
            NavigationControls()
            
            Spacer()
        }
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: .mint)
    }
}
