//
//  MainViewModel.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import Foundation
import RxFlow
import RxCocoa

class MainViewModel : Stepper {
  let steps =  PublishRelay<Step>()
}
