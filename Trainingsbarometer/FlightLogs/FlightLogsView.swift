//
//  FlightLogsView.swift
//  Trainingsbarometer
//
//  Created by Jonas Vetsch on 03.06.2024.
//

import SwiftUI
import SwiftData

struct FlightLogsView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.modelContext) private var context
    
    @Query private var flightLogs: [FlightLog]
    
    @State private var newFlightLog: FlightLog?
    @State private var selectedFlight: FlightLog?
    @State private var showConfirmation = false
    
    @State private var sortRule: String? = "Newest"
    
    var sortedFlightLogs: [FlightLog] {
        switch sortRule {
        case "Newest":
            return flightLogs.sorted { $0.departureDate! > $1.departureDate! }
        case "Oldest":
            return flightLogs.sorted { $0.departureDate! < $1.departureDate! }
        case "Longest":
            return flightLogs.sorted { $0.flightTime > $1.flightTime }
        case "Shortest":
            return flightLogs.sorted { $0.flightTime < $1.flightTime }
        default:
            return flightLogs
        }
    }
    
    var body: some View {
        ZStack {
            // Background
            BackgroundView()
            
            // Content
            VStack (alignment: .leading) {
                
                HStack {
                    Text("Flights")
                        .font(.mainHeadline)
                        
                    Spacer()
                    
                    // Sort Menu
                    Menu {
                        Text("Sort Flights by")
                        Button(action: {
                            sortRule = "Newest"
                        }) {
                            Label("Newest", systemImage: "calendar")
                        }
                        
                        Button(action: {
                            sortRule = "Oldest"
                        }) {
                            Label("Oldest", systemImage: "calendar")
                        }
                        
                        Button(action: {
                            sortRule = "Longest"
                        }) {
                            Label("Longest", systemImage: "clock")
                        }
                        
                        Button(action: {
                            sortRule = "Shortest"
                        }) {
                            Label("Shortest", systemImage: "clock")
                        }
                        
                        
                    } label: {
                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                            .font(.system(size: 20))
                            .opacity(0.7)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    
                    
                }
                .padding(.top, 80)
                .padding(.horizontal)
                
                // –– Flight Logs List ––
                List(sortedFlightLogs, id: \.id) { flightLog in
                    FlightLogCardView(flightLog: flightLog)
                        .padding(0)
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        .swipeActions {
                            // Edit flight log
                            Button {
                                newFlightLog = flightLog
                            } label: {
                                Label("Edit", systemImage: "pencil")
                            }.tint(.blue)
                            
                            // Delete flight log
                            Button(role: .destructive) {
                                selectedFlight = flightLog
                                showConfirmation = true
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
                .padding(.bottom, 80)
                .listStyle(PlainListStyle())
                .listRowSpacing(0)
            }
            
            
            // Navigation Buttons
            VStack (alignment: .trailing) {
                Spacer()
                HStack {
                    // Back Button
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 25))
                    })
                    Spacer()
                    
                    // Add FlightLog Button
                    Button(action: {
                        // Create an empty FlighLog
                        self.newFlightLog = FlightLog()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30))
                    })
                }
                .buttonStyle(PlainButtonStyle())
                .padding(35)
            }
            
            // Show warning if app is using sample data
            SampleDataWarningView()
            
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true) // Hides the default back button from NavigationLink in HomeView
        .sheet(item: $newFlightLog) { flightlog in
            let isEdit = flightlog.departureDate != nil // Check if it's a fresh instance of FlightLog
            EditFlightLogView(flightLog: flightlog, isEditMode: isEdit)
        }
        .confirmationDialog("Are you sure you want to delete the flight?", isPresented: $showConfirmation, titleVisibility: .visible) {
            Button("Delete", role: .destructive) {
                context.delete(selectedFlight!)
            }
            .foregroundStyle(.red)
        }
    }
}

#Preview {
    FlightLogsView()
}
