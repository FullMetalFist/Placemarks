//
//  PageView.swift
//  Placemarks
//
//  Created by Michael Vilabrera on 2/12/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(placemark: $0)})
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
