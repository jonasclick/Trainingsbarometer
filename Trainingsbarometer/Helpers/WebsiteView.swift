//
//  WebsiteView.swift
//  Trainingsbarometer
//
//  Created by Jonas Vetsch on 30.06.2024.
//

import SwiftUI

struct WebsiteView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var title: String
    var url: String
    
    var body: some View {
        ZStack {
            
            VStack {
                Text(title)
                    .bold()
                    .padding(.top)
                
                WebView(url: URL(string: url)!)
                    .edgesIgnoringSafeArea(.all)
            }
            
            // Close button top right
            CloseButtonView()
                
        }
    }
}

#Preview {
    WebsiteView(title: "Test", url: "https://www.apple.com")
}
