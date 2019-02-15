//
//  Assembly.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import UIKit
import Swinject

class HomeAssembly: Assembly {
  func assemble(container: Container) {
    
    container.register(ViewModel.self) { _  in
      return ViewModel()
    }.inObjectScope(.graph)
    
    container.register(ViewModel2.self) { _  in
      return ViewModel2()
      }.inObjectScope(.graph)
    
    container.register(MainViewModel.self) { _  in
      return MainViewModel()
      }.inObjectScope(.graph)
    
    
    container.register(ViewController.self) { resolver  in
      let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
      let temp = storyboard.instantiateViewController(withIdentifier: "ViewController")
      let viewController = temp as!  ViewController
      viewController.viewModel = resolver.resolve(ViewModel.self)!
      return viewController
    }
    
    container.register(SecondViewController.self) { resolver  in
      let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
      let temp = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
      let viewController = temp as!  SecondViewController
      viewController.viewModel = resolver.resolve(ViewModel2.self)!
      return viewController
    }
    
    container.register(MainViewController.self) { resolver  in
      let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
      let temp = storyboard.instantiateViewController(withIdentifier: "MainViewController")
      let viewController = temp as!  MainViewController
      viewController.viewModel = resolver.resolve(MainViewModel.self)!
      return viewController
    }
    
  }
}
