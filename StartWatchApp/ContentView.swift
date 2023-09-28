//
//  ContentView.swift
//  StartWatchApp
//
//  Created by Leo Dion on 9/28/23.
//

import SwiftUI
import HealthKit

let healthStore = HKHealthStore()

struct ContentView: View {
    var body: some View {
        VStack {
          Button {
            Task {
              var workoutConfiguration = HKWorkoutConfiguration()
              workoutConfiguration.activityType = .running
              try! await healthStore.startWatchApp(toHandle: workoutConfiguration)
              print("send message")
            }
          } label: {
            Text("Start App")
          }
          Button {
            Task {
              try! await healthStore.requestAuthorization(toShare: nil, read: [HKQuantityType(.heartRate)]) { value, error in
                print(value, error)
              }
            }
          } label: {
            Text("Permissions")
          }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
