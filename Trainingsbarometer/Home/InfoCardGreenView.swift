//
//  InfoCardGreenView.swift
//  Trainingsbarometer
//
//  Created by Jonas Vetsch on 24.06.2024.
//

import SwiftUI

struct InfoCardGreenView: View {
    var body: some View {
        
        VStack (alignment: .leading) {
            // Info Card Title
            HStack {
                Image(systemName: "info.circle")
                    .bold()
                Text("Experienced pilots make the following mistakes")
                    .font(.infoBoxHeadline)
            }
            .padding(.bottom, 15)
            
            VStack (alignment: .leading) {
                // Info Card Text
                HStack {
                    Image(systemName: "chevron.forward")
                        .scaleEffect(0.7)
                    Text("Glider improperly equipped")
                }
                .padding(.bottom, 2)
                HStack {
                    Image(systemName: "chevron.forward")
                        .scaleEffect(0.7)
                    Text("Not performing cockpit check correctly")
                }
                .padding(.bottom, 2)
                HStack {
                    Image(systemName: "chevron.forward")
                        .scaleEffect(0.7)
                    Text("Misbehavior during aborted takeoffs")
                }
                .padding(.bottom, 2)
                HStack {
                    Image(systemName: "chevron.forward")
                        .scaleEffect(0.7)
                    Text("Poorly flown landing pattern (e.g. during outlanding)")
                }
            }
            .padding(.leading, 5)
            .font(.infoBoxContent)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.barometerGreen)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.2), radius: 7, x: 3, y: 4)
        .padding(.bottom, 40)
        
    }
}

#Preview {
    InfoCardGreenView()
}
