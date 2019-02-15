//
//  DashboardFlow.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import UIKit
import RxFlow

class MainFlow: Flow {
  
  var root: Presentable {
    return self.rootViewController
  }
  
  var rootViewController = UINavigationController()
  
  let dependency: DependencyRegistry
  
  init(dependency: DependencyRegistry) {
    self.dependency = dependency
  }
  
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? Homestep else { return .none }
    switch step {
    case .home:
      return navigateToHome()
    }
  }
  
  fileprivate func navigateToHome() -> FlowContributors {
    let viewController = dependency.resolver.resolve(MainViewController.self)!
    self.rootViewController.pushViewController(viewController, animated: true)
    
    
    let dashboardFlow = DashboardFlow(dependency: dependency)
    
    Flows.whenReady(flow1: dashboardFlow) { [unowned self] root in
      self.rootViewController.pushViewController(root, animated: false)
    }
    
    return .one(flowContributor: .contribute(withNextPresentable: dashboardFlow,
                                             withNextStepper: OneStepper(withSingleStep: AppStep.dashboard)))
    
//    return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.viewModel))
    
    
  }
}

class HomeFlow: Flow {
  
  var root: Presentable {
    return self.rootViewController
  }
  
  var rootViewController = UINavigationController()
  
  let dependency: DependencyRegistry
  
  init(dependency: DependencyRegistry) {
    self.dependency = dependency
  }
  
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? Homestep else { return .none }
    switch step {
    case .home:
      return navigateToHome()
    }
  }
  
  fileprivate func navigateToHome() -> FlowContributors {
    let viewController = dependency.resolver.resolve(ViewController.self)!
    self.rootViewController.pushViewController(viewController, animated: true)
    return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.viewModel))
  }
}


class SecondFlow: Flow {
  
  var root: Presentable {
    return self.rootViewController
  }
  
  let rootViewController = UINavigationController()
  
  let dependency: DependencyRegistry
  
  init(dependency: DependencyRegistry) {
    self.dependency = dependency
  }
  
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? Homestep else { return .none }
    switch step {
    case .home:
      return navigateToHome()
    }
  }
    
    fileprivate func navigateToHome() -> FlowContributors {
     let viewController = dependency.resolver.resolve(SecondViewController.self)!
      self.rootViewController.pushViewController(viewController, animated: true)
     return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.viewModel))
  }
}
