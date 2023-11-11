//
//  ScreenTimeSelectAppsContentView.swift
//  Landmarks
//
//  Created by Mohamad Yahia on 10.11.2023.
//

import SwiftUI

struct ParentalMainView: View {

    @State private var pickerIsPresented = false
    @EnvironmentObject var model: ScreenTimeSelectApps

    var body: some View {
        Button {
            pickerIsPresented = true
        } label: {
            Text("Select Apps")
        }
        .familyActivityPicker(
            isPresented: $pickerIsPresented,
            selection: $model.activitySelection
        )
//        .onChange(of: pickerIsPresented) { bool in
//            
//            if !bool {
//                model.saveSelection()
//                print("DEBUG: IS APPS EMPTY?? \(model.activitySelection.applications.isEmpty)")
//            }
//        }
    }
}
