//
//  SecondViewController.swift
//  TestRxFlow2
//
//  Created by dsk on 14/02/19.
//  Copyright © 2019 SISKH. All rights reserved.
//

import UIKit
import RxFlow
import RxCocoa

class ViewModel2: Stepper {
  let two = "Two view model"
  var steps = PublishRelay<Step>()
}

class SecondViewController: UIViewController {
  
  var viewModel: ViewModel2!
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
      print(viewModel.two)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
