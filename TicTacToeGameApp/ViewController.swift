//
//  ViewController.swift
//  TicTacToeGameApp
//
//  Created by Veldanov, Anton on 4/29/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // 1 noughts, 2 is crosses
  
  var  activePlayer = 1
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


  @IBAction func buttonPressed(_ sender: UIButton) {
    
    if activePlayer == 1{
       sender.setImage(UIImage(named: "nought.png"), for: .normal)
      activePlayer = 2
    }else{
        sender.setImage(UIImage(named: "cross.png"), for: .normal)
      
      activePlayer = 1
      
    }
    
    
  
    
  }
}

