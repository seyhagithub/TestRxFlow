//
//  AppDelegate.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import UIKit
import RxFlow
import RxCocoa
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let coordinator = FlowCoordinator()
  
  static var dependencyRegistry: DependencyRegistry!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    AppDelegate.dependencyRegistry = DependencyRegistry()
    
    
    
    let dashboardFlow = DashboardFlow(dependency: DependencyRegistry())
    
    guard let window = self.window else { return true }
    
    Flows.whenReady(flow1: dashboardFlow, block: { [unowned window] (flowRoot) in
      window.rootViewController = flowRoot
      window.makeKeyAndVisible()
    })
    self.coordinator.coordinate(flow: dashboardFlow, with: OneStepper(withSingleStep: AppStep.dashboard))
    
  
    return true
  }

  


}

