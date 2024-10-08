//
//  FontHelper.swift
//  Trainingsbarometer
//
//  Created by Jonas Vetsch on 03.06.2024.
//

import Foundation
import SwiftUI

extension Font {
    
    // HomeView
    static var sectionHeadline = Font.system(size: 14, weight: .light)
    static var mainHeadline = Font.system(size: 34, weight: .semibold)
    static var infoBoxHeadline = Font.system(size: 14, weight: .bold)
    static var infoBoxContent = Font.system(size: 12, weight: .light)
    static var statNumber = Font.system(size: 37, weight: .semibold)
    
    
    // FlightLogsView
    static var flightLogPrimary = Font.system(size: 14, weight: .medium)
    static var flightLogSecondary = Font.system(size: 14, weight: .light) // Set opacity to 70%
    
    
    // Add FlightLog Sheet
    static var sheetHeadline = Font.system(size: 15, weight: .medium)
    static var paragraphHeadline = Font.system(size: 15)
    static var paragraphText = Font.system(size: 13)
    
    
}
