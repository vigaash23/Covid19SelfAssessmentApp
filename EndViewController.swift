//
//  EndViewController.swift
//  covid19
//
//  Created by Vigaash Sivasothy on 2020-05-25.
//  Copyright © 2020 Vigaash Sivasothy. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    var quizModule: Quiz!
  
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settup()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func settup() {
        setTotal()
    }
    
    func setTotal() {
        if (quizModule.GiveScore() > 3) {
            totalLabel.text = "Based on your answers, we recommend you get tested"
        }
        else {
            totalLabel.text = "Based on your answers, we recommend you do not need to get tested"
        }
    }
     
}
