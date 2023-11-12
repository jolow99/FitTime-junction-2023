//
//  DeviceActivityCenterVM.swift
//  Landmarks
//
//  Created by Mohamad Yahia on 12.11.2023.
//

import Foundation
import DeviceActivity
import FamilyControls

class DeviceActivityCenterVM: DeviceActivityMonitor, ObservableObject {
    
    @Published var maximumAllowedAppUsageMinutes: Int
    @Published var timeEnded: Bool = false
    
    let schedule = DeviceActivitySchedule(
        intervalStart: DateComponents(hour: 0, minute: 0, second: 0),
        intervalEnd: DateComponents(hour: 23, minute: 59, second: 59),
        repeats: true
    )
    
    var appSelection: FamilyActivitySelection?
    
    let event: DeviceActivityEvent?
    
    override init() {
        
        self.maximumAllowedAppUsageMinutes = 30
        
        let appSelection = UserDefaultsManager().loadSelection()
        
        if appSelection != nil {
            self.appSelection = appSelection
        } else {
            self.appSelection = nil
        }
        
        if self.appSelection != nil {
            self.event = DeviceActivityEvent(applications: self.appSelection!.applicationTokens, categories: self.appSelection!.categoryTokens, webDomains: self.appSelection!.webDomainTokens, threshold: DateComponents(minute: 30))
        } else {
            self.event = nil
        }
        
    }
    
    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        super.eventDidReachThreshold(event, activity: activity)
        
        self.timeEnded = true
    }
    
    func changeAllowedUsageMinutes(newAllowedMinutes: Int) {
        self.maximumAllowedAppUsageMinutes = newAllowedMinutes
    }
    
    func startMonitoring() {
        let center = DeviceActivityCenter()
        center.stopMonitoring()
        
        let activity = DeviceActivityName("Landmarks.ScreenTime")
        let eventName = DeviceActivityEvent.Name("Landmarks.CheckForTimeEvent")
        
        if self.event != nil {
            try! center.startMonitoring(
                activity,
                during: schedule,
                events: [
                    eventName: event!
                ]
            )
        }
    }
}
