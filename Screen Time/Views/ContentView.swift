//
//  ContentView.swift
//  Landmarks
//
//  Created by Joseph Low on 11/10/23.
//

import SwiftUI
import FamilyControls

struct ContentView: View {
    
    @EnvironmentObject var screenTimeSelection: ScreenTimeSelectApps
    let center = AuthorizationCenter.shared
    
    var body: some View {
        Group {
            ZStack {
                if
                    self.screenTimeSelection.activitySelection.applications.isEmpty {
                    ParentalMainView()
                } else {
                    ChildFlowView()
                }
            }
        }
        .environmentObject(screenTimeSelection)
        .onAppear {
            Task {
                do {
                    try await center.requestAuthorization(for: FamilyControlsMember.individual)
                } catch {
                    print(error)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
