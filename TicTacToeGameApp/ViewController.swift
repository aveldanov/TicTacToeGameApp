//
//  ViewController.swift
//  TicTacToeGameApp
//
//  Created by Veldanov, Anton on 4/29/20.
//  Copyright © 2020 Anton Veldanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var activeGame = true
  
  
  // 1 noughts, 2 is crosses
  var  activePlayer = 1
  
  var  gameState = [0,0,0,0,0,0,0,0,0] // 0 -none, 1 - nought, 2 - cross
  
  let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  
  
  @IBOutlet weak var winnerLabel: UILabel!
  @IBOutlet weak var playAgainButton: UIButton!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    winnerLabel.isHidden = true
    playAgainButton.isHidden = true
    
    winnerLabel.center = CGPoint(x: winnerLabel.center.x
      , y: winnerLabel.center.y - 500)
    
    playAgainButton.center = CGPoint(x: playAgainButton.center.x
         , y: playAgainButton.center.y + 500)
  
  }
  
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    
    let activePosition = sender.tag - 1
    
    if gameState[activePosition] == 0 && activeGame{
      gameState[activePosition] = activePlayer
      
      if activePlayer == 1{
        sender.setImage(UIImage(named: "nought.png"), for: .normal)
        
        
        
        activePlayer = 2
        
      }else{
        sender.setImage(UIImage(named: "cross.png"), for: .normal)

        activePlayer = 1
        
      }
      
    }
//    let winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    for combination in winningCombinations{
//      print(gameState)
//      print("comb0", combination[0])
//      print("comb1", combination[1])
//      print("comb2", combination[2])
//      
//      print("GScomb0", gameState[combination[0]])
//      print("GScomb1", gameState[combination[1]])
//      print("GScomb2", gameState[combination[2]])
//      
//      print("")

      if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[0]] == gameState[combination[2]]{

        
        activeGame = false
        print("We have a winner \(gameState[combination[0]])")
        
        winnerLabel.isHidden = false
        playAgainButton.isHidden = false
        
        if gameState[combination[0]] == 1 {
          
          winnerLabel.text = "Noughts have won!"
          
          }else{
          
          winnerLabel.text = "Crosses have won!"

        }
        
        UIView.animate(withDuration: 1) {
          self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x, y: self.winnerLabel.center.y + 500)
          
          self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x, y: self.playAgainButton.center.y - 500)
        }

      }
      
    }
    
    print(gameState)

  }
  
  
  
  
  @IBAction func playAgainButtonPressed(_ sender: UIButton) {
  }
  
  
}

