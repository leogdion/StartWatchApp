//
//  StartWatchAppApp.swift
//  StartWatchApp Watch App
//
//  Created by Leo Dion on 9/28/23.
//

import SwiftUI
import WatchKit
import HealthKit

class WatchDelegate : NSObject, WKApplicationDelegate {
  
  override init() {
    super.init()
  }
  
  //@Published var workoutConfiguration : HKWorkoutConfiguration?
  
  func handle(_ workoutConfiguration: HKWorkoutConfiguration) {
    Task { @MainActor in
     dump(workoutConfiguration)
    }
  }
}
@main
struct StartWatchApp_Watch_AppApp: App {
  @WKApplicationDelegateAdaptor var appAdaptor : WatchDelegate
  
    var body: some Scene {
        WindowGroup {
          ContentView(workoutConfiguration: nil)
        }
    }
}
