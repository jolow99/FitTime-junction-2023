////
////  UserDefaultsManager.swift
////  Landmarks
////
////  Created by Mohamad Yahia on 11.11.2023.
////

import Foundation
import SwiftUI
import FamilyControls

class UserDefaultsManager {
    
    init() {
        
    }
    
    let shared = UserDefaultsManager()
    
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
    
}
