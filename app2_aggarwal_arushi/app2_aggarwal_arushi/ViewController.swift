//
//  ViewController.swift
//  app2_aggarwal_arushi
//
//  Created by Arushi Aggarwal on 9/12/20.
//  Copyright © 2020 Arushi Aggarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var trackTurn = true
    var score1 = 0
    var score2 = 0
    var numTurns = 0
    var spotClicked = [0,0,0,0,0,0,0,0,0]
    
    let buttonImageX = UIImage(named: "mark-x.png")?.withRenderingMode(.alwaysTemplate)
    let buttonImageO = UIImage(named: "mark-o.png")?.withRenderingMode(.alwaysTemplate)
    let buttonImageNone = UIImage(named: "mark-none.png")?.withRenderingMode(.alwaysTemplate)
    
    //each slot represents a row/column/diagonal, total 8
    var grid1 = [0,0,0,0,0,0,0,0]
    var grid2 = [0,0,0,0,0,0,0,0]
    
    func increment(_ int: Int, _ player: Int) {
        var grid = grid1
        if player == 2 {
            grid = grid2
        }
        if int == 1 {
            grid[0]+=1
            grid[3]+=1
            grid[6]+=1
        }
        else if int == 2 {
            grid[1]+=1
            grid[3]+=1
        }
        else if int == 3 {
            grid[2]+=1
            grid[3]+=1
            grid[7]+=1
        }
        else if int == 4 {
            grid[0]+=1
            grid[4]+=1
        }
        else if int == 5 {
            grid[1]+=1
            grid[4]+=1
            grid[6]+=1
            grid[7]+=1
        }
        else if int == 6 {
            grid[2]+=1
            grid[4]+=1
        }
        else if int == 7 {
            grid[0]+=1
            grid[5]+=1
            grid[7]+=1
        }
        else if int == 8 {
            grid[1]+=1
            grid[5]+=1
        }
        else if int == 9 {
            grid[2]+=1
            grid[5]+=1
            grid[6]+=1
        }
        if player == 1 {
            grid1 = grid
        }
        else if player == 2 {
            grid2 = grid
        }
        print(grid1)
        print(grid2)
    }
    
    
    @IBOutlet weak var player1score: UILabel!
    @IBOutlet weak var player2score: UILabel!
    @IBOutlet weak var turn: UILabel!
    
    @IBOutlet var collectionOfButtons: Array<UIButton>!
    
    
    @IBAction func click(_ sender: UIButton) {
        
        if spotClicked[sender.tag-1] == 0 {
        
            spotClicked[sender.tag-1] = 1
            
            if (trackTurn == true) {
                sender.setImage(buttonImageX, for: .normal)
                sender.tintColor = .systemBlue
                trackTurn = false
                turn.text = "Player 2's Turn"
                increment(sender.tag, 1)
            }
            else {
                sender.setImage(buttonImageO, for: .normal)
                sender.tintColor = .systemBlue
                trackTurn = true
                turn.text = "Player 1's Turn"
                increment(sender.tag, 2)
            }
            
            print(sender.tag)
            numTurns += 1
            
            if grid1.contains(3){
                score1 += 1
                player1score.text = "Player 1 Score: \(score1)"
                turn.text = "Player 1 Wins!"
                turn.textColor = UIColor.green
                spotClicked = [1,1,1,1,1,1,1,1,1]
                winTint(grid1.firstIndex(of: 3)! + 1)
            }
            else if grid2.contains(3){
                score2 += 1
                player2score.text = "Player 2 Score: \(score2)"
                turn.text = "Player 2 Wins!"
                turn.textColor = UIColor.green
                spotClicked = [1,1,1,1,1,1,1,1,1]
                winTint(grid2.firstIndex(of: 3)! + 1)
            }
            if numTurns == 9 {
                turn.text = "Draw"
                turn.textColor = UIColor.purple
                for button in collectionOfButtons {
                    button.tintColor = .systemGray
                }
            }
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        for button in collectionOfButtons {
            button.setImage(UIImage(named: "mark-none.png"), for: .normal)
        }
        turn.text = "Player 1's Turn"
        turn.textColor = UIColor.black
        trackTurn = true
        numTurns = 0
        spotClicked = [0,0,0,0,0,0,0,0,0]
        grid1 = [0,0,0,0,0,0,0,0]
        grid2 = [0,0,0,0,0,0,0,0]
        
    }
    
    func winTint(_ int: Int) {
        if int ==  1 {
            collectionOfButtons[0].tintColor = .systemYellow
            collectionOfButtons[3].tintColor = .systemYellow
            collectionOfButtons[6].tintColor = .systemYellow
        }
        else if int ==  2 {
            collectionOfButtons[1].tintColor = .systemYellow
            collectionOfButtons[4].tintColor = .systemYellow
            collectionOfButtons[7].tintColor = .systemYellow
        }
        else if int ==  3 {
            collectionOfButtons[2].tintColor = .systemYellow
            collectionOfButtons[5].tintColor = .systemYellow
            collectionOfButtons[8].tintColor = .systemYellow
        }
        else if int ==  4 {
            collectionOfButtons[0].tintColor = .systemYellow
            collectionOfButtons[1].tintColor = .systemYellow
            collectionOfButtons[2].tintColor = .systemYellow
        }
        else if int ==  5 {
            collectionOfButtons[3].tintColor = .systemYellow
            collectionOfButtons[4].tintColor = .systemYellow
            collectionOfButtons[5].tintColor = .systemYellow
        }
        else if int ==  6 {
            collectionOfButtons[6].tintColor = .systemYellow
            collectionOfButtons[7].tintColor = .systemYellow
            collectionOfButtons[8].tintColor = .systemYellow
        }
        else if int ==  7 {
            collectionOfButtons[0].tintColor = .systemYellow
            collectionOfButtons[4].tintColor = .systemYellow
            collectionOfButtons[8].tintColor = .systemYellow
        }
        else if int ==  8 {
            collectionOfButtons[2].tintColor = .systemYellow
            collectionOfButtons[4].tintColor = .systemYellow
            collectionOfButtons[6].tintColor = .systemYellow
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

