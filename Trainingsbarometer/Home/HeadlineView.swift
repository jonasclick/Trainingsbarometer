//
//  HeadlineView.swift
//  Trainingsbarometer
//
//  Created by Jonas Vetsch on 24.06.2024.
//

import SwiftUI

struct HeadlineView: View {
    
    @Binding var trainingState: Int
    
    let stateOneString = try! AttributedString(
        markdown: "Practice is necessary - flying can become a __risk__.")
    
    let stateTwoString1 = try! AttributedString(
        markdown: "More practice couldn't hurt – __unexpected events__ can become dangerous.")
    
    let stateTwoString2 = try! AttributedString(
        markdown: "hurt – __unexpected events__ can")
    
    let stateTwoString3 = try! AttributedString(
        markdown: "become dangerous.")
    
    let stateThreeString = try! AttributedString(
        markdown: "Your practice state is good – but still __be cautious.__")
    
    
    var body: some View {
        
        // Headline Text
        if trainingState == 1 {
            Text(stateOneString)
                .font(.system(size: 32))
                .padding(.bottom, 40)
        }
        else if trainingState == 2 {
//            Text("\(stateTwoString1)\n\(stateTwoString2)\n\(stateTwoString3)")
            Text("\(stateTwoString1)")
                .font(.system(size: 27))
                .padding(.bottom, 40)
        }
        else if trainingState == 3 {
            Text(stateThreeString)
                .font(.system(size: 34))
                .padding(.bottom, 40)
        }
        
    }
}
