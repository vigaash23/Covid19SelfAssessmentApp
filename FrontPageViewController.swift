//
//  FrontPageViewController.swift
//  covid19
//
//  Created by Vigaash Sivasothy on 2020-05-25.
//  Copyright © 2020 Vigaash Sivasothy. All rights reserved.
//

import UIKit

class FrontPageViewController: UIViewController {
    var quizModule: Quiz = Quiz.init()
    
    @IBAction func StartPress(_ sender: Any) {
        performSegue(withIdentifier: "StartToQuiz", sender: nil)
    }
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        button.layer.cornerRadius = 25.0
        button.backgroundColor = UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "StartToQuiz") {
            let seg = segue.destination as! QuizViewController
            seg.quizModule = self.quizModule
        }
        
    }
    
    

}
