//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Joseph Low on 11/10/23.
//

import SwiftUI
import FamilyControls

@main
struct LandmarksApp: App {
    
    @ObservedObject var screenTimeSelection: ScreenTimeSelectApps = ScreenTimeSelectApps()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(screenTimeSelection)
                .onAppear {
                    print("Init")
                    
                    let appSelection = screenTimeSelection.loadSelection()
                    
                    print(appSelection)
                    
                    if appSelection != nil {
                        screenTimeSelection.activitySelection = appSelection!
                    }
                }
        }
    }
}
