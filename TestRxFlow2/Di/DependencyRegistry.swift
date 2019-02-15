//
//  DependencyRegistry.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import Foundation


class DependencyRegistry: RootDependency {
  
  override func setupDependencies() {
    
    assembler.apply(assembly: HomeAssembly())
    
  }
}
