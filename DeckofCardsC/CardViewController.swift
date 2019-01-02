//
//  CardViewController.swift
//  DeckofCardsC
//
//  Created by Jack Knight on 1/1/19.
//  Copyright © 2019 Jack Knight. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    //   MARK: - Outlets
    
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var suitLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //   MARK: - Actions
    @IBAction func cardButtonTapped(_ sender: Any) {
       UIApplication.shared.isNetworkActivityIndicatorVisible = true
        DVMCardController.fetchCard { (card) in
            guard let card = card else {return}
            DVMCardController.fetchCardImage(with: card, completion: { (image) in
                DispatchQueue.main.async {
                 UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.cardImageView.image = image
                }
            })
        }
    }
}
