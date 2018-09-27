//Joshua Paulsen - The Rise Collection

import UIKit

class ViewController: UIViewController, SwipeableCardViewDataSource {

    @IBOutlet private weak var swipeableCardView: SwipeableCardViewContainer!

    override func viewDidLoad() {
        super.viewDidLoad()

        swipeableCardView.dataSource = self
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
                                                     color: UIColor(red:0.96, green:0.81, blue:0.46, alpha:1.0),
                                                     image: #imageLiteral(resourceName: "hamburger"))

        let panda = SampleSwipeableCellViewModel(title: "About",
                                                  subtitle: "Play SWAY against AI",
                                                  color: UIColor(red:0.29, green:0.64, blue:0.96, alpha:1.0),
                                                  image: #imageLiteral(resourceName: "panda"))

        let puppy = SampleSwipeableCellViewModel(title: "Developer's",
                                                  subtitle: "The Rise Collection",
                                                  color: UIColor(red:0.29, green:0.63, blue:0.49, alpha:1.0),
                                                  image: #imageLiteral(resourceName: "puppy"))

        let poop = SampleSwipeableCellViewModel(title: "Rating",
                                                  subtitle: "⭐⭐⭐⭐⭐?",
                                                  color: UIColor(red:0.69, green:0.52, blue:0.38, alpha:1.0),
                                                  image: #imageLiteral(resourceName: "poop"))

        let robot = SampleSwipeableCellViewModel(title: "Tweet Us",
                                                  subtitle: "@risecollectweet",
                                                  color: UIColor(red:0.90, green:0.99, blue:0.97, alpha:1.0),
                                                  image: #imageLiteral(resourceName: "robot"))

        let clown = SampleSwipeableCellViewModel(title: "The End",
                                                  subtitle: "Enjoy!",
                                                  color: UIColor(red:0.83, green:0.82, blue:0.69, alpha:1.0),
                                                  image: #imageLiteral(resourceName: "clown"))

        return [hamburger, panda, puppy, poop, robot, clown]
    }

}

