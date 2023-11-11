//
//  ScreenTimeSelectApps.swift
//  Landmarks
//
//  Created by Mohamad Yahia on 10.11.2023.
//

import Foundation
import SwiftUI
import FamilyControls

class ScreenTimeSelectApps: ObservableObject {
    @Published var activitySelection = FamilyActivitySelection()
    
    init() {
    }
    
    func saveSelection() {
        let defaults = UserDefaults.standard
        if let encoded = try? JSONEncoder().encode(self.activitySelection) {
            print("selection above, encoded below")
            print(encoded)
            defaults.set(encoded, forKey: "SelectedApps")
        }
    }
    
    func loadSelection() -> FamilyActivitySelection? {
        let defaults = UserDefaults.standard
        if let savedSelection = defaults.object(forKey: "SelectedApps") as? Data {
            print(savedSelection)
            if let loadedSelection = try? JSONDecoder().decode(FamilyActivitySelection.self, from: savedSelection) {
                print("saved selection above, loaded selection below")
                print(loadedSelection)
                return loadedSelection
            }
        }
        return nil
    }
    
    func deleteSelection() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "SelectedApps")
        self.activitySelection = FamilyActivitySelection()
    }
    
}
