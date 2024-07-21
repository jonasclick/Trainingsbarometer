//
//  Onboarding2View.swift
//  Trainingsbarometer
//
//  Created by Jonas Vetsch on 05.07.2024.
//

import SwiftUI

struct Onboarding2View: View {
    
    @State var shouldPlayVideo: Bool = true
//    @Binding var isOnboardingCompleted: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack (alignment: .center) {
                    
                    // Title "Onboarding"
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Onboarding")
                                .font(.mainHeadline)
                            Text("What is this app “Pilot Practice Barometer” for?")
                                .font(.infoBoxContent)
                                .opacity(0.8)
                                .padding(.top, -10)
                        }
                        .frame(idealWidth: .infinity)
                        .padding()
                        
                        Spacer()
                    }
                    
                    // Onboarding Video
                    if let localVideoURL = Bundle.main.url(forResource: "Why TBARO", withExtension: "mov") {
                        VideoPlayerView(videoURL: localVideoURL)
                            .aspectRatio(9/16, contentMode: .fill)
    //                        .padding(.top, -20)
                            .frame(height: 600)
                            .clipped()

                    } else {
                        Text("We're sorry, the explainer video is currently unavailable.")
                            .font(.flightLogPrimary)
                    }
                    
                    Spacer()
                    
                }
                
                
                // Button "Continue" to next onboarding step
                NavigationLink (destination: {
                    Onboarding3View()
                }, label: {
                    HStack {
                        Text("Continue")
                        Image(systemName: "arrow.right.circle.fill")
                    }
                    .font(.flightLogSecondary)
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.top, 700)
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    Onboarding2View()
//}
