//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Joseph Low on 11/10/23.
//

import SwiftUI
import FamilyControls
import DeviceActivity


@main
struct LandmarksApp: App {
    @StateObject var screenTimeSelection: ScreenTimeSelectApps = ScreenTimeSelectApps()
    @StateObject var deviveActivityCenter: DeviceActivityCenterVM = DeviceActivityCenterVM()
    
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environmentObject(screenTimeSelection)
                .environmentObject(deviveActivityCenter)
                .onAppear {
                    print("Init")
                    
                    let appSelection = screenTimeSelection.loadSelection()

                    //print(appSelection?.applications)
                    
                    if appSelection != nil {
                        screenTimeSelection.activitySelection = appSelection!
                        print("Moved to the observable")
                    }
                    
                }
        }
    }
}
