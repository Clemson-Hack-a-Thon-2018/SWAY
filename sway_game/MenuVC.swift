

import Foundation
import UIKit

enum gameType {
    case easy
    case medium
    case hard
    case player2
}

class MenuVC : UIViewController {
    
    

    
    @IBAction func Easy(_ sender: Any) {
        moveToGame(game: .easy)
    }
    @IBAction func Medium(_ sender: Any) {
        moveToGame(game: .medium)
        
    }
    @IBAction func Hard(_ sender: Any) {
        moveToGame(game: .hard)
    }
    
    func moveToGame(game : gameType) {
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        currentGameType = game

        self.show(gameVC, sender: true)
    }
}
