//
//  ContentView.swift
//  StartWatchApp Watch App
//
//  Created by Leo Dion on 9/28/23.
//

import SwiftUI
import HealthKit

struct ContentView: View {
  let workoutConfiguration : HKWorkoutConfiguration?
    var body: some View {
        VStack {
          Button {
            HKHealthStore().requestAuthorization(toShare: [.workoutType()], read: [HKQuantityType(.heartRate)]) { value, error in
              print(value, error)
            }
          } label: {
            Text("Ask Permission")
          }

            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
          if let workoutConfiguration {
            Text(workoutConfiguration.debugDescription)
          }
        }
        .padding()
    }
}

#Preview {
  ContentView(workoutConfiguration: nil)
}
