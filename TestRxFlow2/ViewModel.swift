//
//  ViewModel.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import Foundation
import RxFlow
import RxCocoa


class ViewModel: Stepper {
  var steps = PublishRelay<Step>()
  let title = "Hello"
}
