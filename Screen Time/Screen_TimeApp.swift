//
//  Screen_TimeApp.swift
//  Screen Time
//
//  Created by Tarık Yılıkoğlu on 19.07.2022.
//

import SwiftUI
import DeviceActivity
import FamilyControls

@main
struct Screen_TimeApp: App {
    let center = AuthorizationCenter.shared
    @State var show = false
    @StateObject var screenTimeSelection: ScreenTimeSelectApps = ScreenTimeSelectApps()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if show {
                    ContentView().environmentObject(screenTimeSelection)
                        .onAppear {
                            print("Init")
                            
                            let appSelection = screenTimeSelection.loadSelection()

                            //print(appSelection?.applications)
                            
                            if appSelection != nil {
                                screenTimeSelection.activitySelection = appSelection!
                                print("Moved to the observable")
                            }
                            
                        }
                    ChartView()
                } else {
                    STProgressView()
                }
            }.onAppear {
                Task {
                    do {
                        try await center.requestAuthorization(for: FamilyControlsMember.individual)
                        show = true
                    } catch {
                        // Handle the error here.
                    }
                }
            }
            
        }
    }
}

struct STProgressView: View {
    var body: some View {
        ProgressView {
            Text("Loading")
        }
    }
}
