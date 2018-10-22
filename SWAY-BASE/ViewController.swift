//Joshua Paulsen - The Rise Collection

import UIKit

class ViewController: UIViewController, SwipeableCardViewDataSource {
    


    @IBOutlet weak var swipeableCardView: SwipeableCardViewContainer?
    override func viewDidLoad() {
        super.viewDidLoad()

        swipeableCardView?.dataSource = self
    }

}

// MARK: - SwipeableCardViewDataSource

extension ViewController {

    func numberOfCards() -> Int {
        return viewModels.count
    }

    func card(forItemAtIndex index: Int) -> SwipeableCardViewCard {
        let viewModel = viewModels[index]
        let cardView = SampleSwipeableCard()
        cardView.viewModel = viewModel
        return cardView
    }

    func viewForEmptyCards() -> UIView? {
        return nil
    }

}

extension ViewController {

    var viewModels: [SampleSwipeableCellViewModel] {

        let hamburger = SampleSwipeableCellViewModel(title: "Info",
                                                     subtitle: "Swipe through the cards to read about SWAY",
                                                     color: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                                                     image: #imageLiteral(resourceName: "info-1"))

        let panda = SampleSwipeableCellViewModel(title: "About",
                                                  subtitle: "Play SWAY against AI",
                                                  color: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                                                  image: #imageLiteral(resourceName: "sway"))

        let puppy = SampleSwipeableCellViewModel(title: "Developer's",
                                                  subtitle: "The Rise Collection",
                                                  color: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                                                  image: #imageLiteral(resourceName: "Card3"))

        let poop = SampleSwipeableCellViewModel(title: "Rating",
                                                  subtitle: "⭐⭐⭐⭐⭐?",
                                                  color: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                                                  image: #imageLiteral(resourceName: "appstore"))

        let robot = SampleSwipeableCellViewModel(title: "Find us on playPORTAL",
                                                  subtitle: "Rise Studios is our community name!",
                                                  color: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                                                  image: #imageLiteral(resourceName: "Card1"))
        let clown = SampleSwipeableCellViewModel(title: "The End",
                                                  subtitle: "Enjoy!",
                                                  color: UIColor(red: 1, green: 1, blue: 1, alpha: 1),
                                                  image: #imageLiteral(resourceName: "titile"))

        return [hamburger, panda, puppy, poop, robot, clown]
    }

}

