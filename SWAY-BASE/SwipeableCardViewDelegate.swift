//Joshua Paulsen - The Rise Collection

import Foundation

protocol SwipeableCardViewDelegate: class {

    func didSelect(card: SwipeableCardViewCard, atIndex index: Int)

}
