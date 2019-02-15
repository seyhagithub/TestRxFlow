//
//  ViewController.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var viewModel: ViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
   
   
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
     print("ViewModel \(viewModel.title)")
  }
}

