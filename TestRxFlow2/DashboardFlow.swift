
//
//  d.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import Foundation
import RxFlow
import RxSwift

class DashboardFlow: Flow {
  
  var root: Presentable {
    return self.rootViewController
  }
  
  fileprivate lazy var rootViewController: UITabBarController = {
    let tabBarController = UITabBarController()
    return tabBarController
  }()
  
  let dependency: DependencyRegistry
  
  init(dependency: DependencyRegistry) {
    self.dependency = dependency
  }
  
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AppStep else { return .none }
    switch step {
    case .dashboard:
      return navigateToDashboard()
    }
  }
  
  fileprivate func navigateToDashboard() -> FlowContributors {
    let homeFlow = HomeFlow(dependency: dependency)
    let secondFlow = SecondFlow(dependency: dependency)
    
    Flows.whenReady(flow1: homeFlow, flow2: secondFlow) { [unowned self] (root1: UINavigationController, root2: UINavigationController) in
      
      
      let homeItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: nil)
      
      let homeItem2 = UITabBarItem(title: "Second", image: UIImage(named: "home"), selectedImage: nil)
      
      root1.tabBarItem = homeItem
      root2.tabBarItem = homeItem2
      
      self.rootViewController.setViewControllers([root1, root2], animated: false)
    }
    
    return .multiple(flowContributors: [
      .contribute(withNextPresentable: homeFlow, withNextStepper:OneStepper(withSingleStep: Homestep.home)),
      .contribute(withNextPresentable: secondFlow, withNextStepper: OneStepper(withSingleStep: Homestep.home))
      ])
  }
  
}
