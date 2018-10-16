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
                                                     color: UIColor(hue: 0.7111, saturation: 0.42, brightness: 0, alpha: 1.0),
                                                     image: #imageLiteral(resourceName: "anonUser"))

        let panda = SampleSwipeableCellViewModel(title: "About",
                                                  subtitle: "Play SWAY against AI",
                                                  color: UIColor(hue: 0.7111, saturation: 0.42, brightness: 0, alpha: 1.0),
                                                  image: #imageLiteral(resourceName: "anonUser"))

        let puppy = SampleSwipeableCellViewModel(title: "Developer's",
                                                  subtitle: "The Rise Collection",
                                                  color: UIColor(hue: 0.7111, saturation: 0.42, brightness: 0, alpha: 1.0),
                                                  image: #imageLiteral(resourceName: "anonUser"))

        let poop = SampleSwipeableCellViewModel(title: "Rating",
                                                  subtitle: "⭐⭐⭐⭐⭐?",
                                                  color: UIColor(hue: 0.7111, saturation: 0.42, brightness: 0, alpha: 1.0),
                                                  image: #imageLiteral(resourceName: "anonUser"))

        let robot = SampleSwipeableCellViewModel(title: "Find us on playPORTAL",
                                                  subtitle: "Rise Studios is our community name!",
                                                  color: UIColor(hue: 0.7111, saturation: 0.42, brightness: 0, alpha: 1.0),
                                                  image: #imageLiteral(resourceName: "anonUser"))

        let clown = SampleSwipeableCellViewModel(title: "The End",
                                                  subtitle: "Enjoy!",
                                                  color: UIColor(hue: 0.7111, saturation: 0.42, brightness: 0, alpha: 1.0),
                                                  image: #imageLiteral(resourceName: "anonUser"))

        return [hamburger, panda, puppy, poop, robot, clown]
    }

}

