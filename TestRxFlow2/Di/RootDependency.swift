//
//  RootDependency.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import Foundation
import Swinject

class RootDependency {
  
  let assembler = Assembler()
  lazy var resolver: Resolver = {
    return assembler.resolver
  }()
  
  init() {
    setupDependencies()
  }
  
  func setupDependencies() {}
}
