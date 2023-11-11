//
//  ChildFlowView.swift
//  Landmarks
//
//  Created by Mohamad Yahia on 10.11.2023.
//

import SwiftUI
import Charts

var firstUser = UserDataModel(steps: 8898, minutesUsed: 69, minutesLeft: 21, potentialMinutes: 30)

struct ChildFlowView: View {
    
    @EnvironmentObject var model: ScreenTimeSelectApps
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                
                Button {
                    model.deleteSelection()
                } label: {
                    Image(systemName: "wrench.and.screwdriver.fill")
                        .padding(.trailing, 10)
                }
            }
            
            VStack() {
                Text(String(firstUser.steps))
                    .font(.system(size: 50))
                    .font(.title)
                    .padding(.top, 20)
                
                Text("Steps done")
                    .font(.system(size: 25))
                    .font(.title2)
                
                Text(String(firstUser.minutesLeft))
                    .font(.system(size: 50))
                    .font(.title)
                    .padding(.top, 20)
                
                Text("Minutes left")
                    .font(.system(size: 25))
                    .font(.title2)
            }
            
            Chart {
                BarMark(
                    x: .value("Minutes used", firstUser.minutesUsed),
                    y: .value("Steps left", "steps")
                )
            }
            .chartXAxis(.hidden)
            .frame(height: 40)
            .cornerRadius(12)
            .padding()

            
            Spacer()
            
            VStack {
                
                Button {
                    print("Continue to app pressed")
                } label: {
                    Text("Continue to app")
                        .padding()
                        .background(Color(.systemTeal))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                
                Button {
                    print("Get more time")
                } label: {
                    Text("Get more screen time")
                        .padding()
                        .background(Color(.systemTeal))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
        }
        .onAppear {
            Task {
                print(self.model.activitySelection.applications)
                model.saveSelection()
                print("DEBUG: APPS SELECTED \(model.activitySelection.applications)")
            }
        }
    }
}

struct BarView: View {
    var data: UserDataModel

    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: CGFloat(data.minutesLeft), height: 20)
        }
    }
}

