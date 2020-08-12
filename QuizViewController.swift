//
//  QuizViewController.swift
//  covid19
//
//  Created by Vigaash Sivasothy on 2020-05-25.
//  Copyright © 2020 Vigaash Sivasothy. All rights reserved.
//

import UIKit

class quizCell: UITableViewCell {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    
}

class QuizViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var quizModule: Quiz!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizAnswerList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        answerCheck = quizAnswerList[indexPath.row]
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell") as! quizCell
        cell.answerLabel.text = quizAnswerList[indexPath.row]
        cell.layer.cornerRadius = 35.0
        cell.answerLabel.layer.cornerRadius = 35.0
        
        return cell
    }
    
    var answerCheck = ""
    var quizAnswerList = ["69 +", "1 - 19", "20 - 39", "40 - 69"]
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var CountLabel: UILabel!
    
    
    
    
    @IBAction func ActionSubmit(_ sender: Any) {
        chooseAnswer()
        
    }
    
    @IBOutlet weak var quizTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizTable.delegate = self
        quizTable.dataSource = self
        quizModule.reset()
        submitButton.layer.cornerRadius = 20.0
        submitButton.backgroundColor = UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        quizModule.reset()
        settup(check: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func settup(check: Bool) {
        if(check) {
            setCount()
            setChoices()
            setQuestion()
            quizTable.reloadData()
        }
        else {
            performSegue(withIdentifier: "QuizToEnd", sender: nil)
        }
    }
    
    func setCount() {
        var temp = ""
        temp.append(String(quizModule.GiveCurrentQuestionValue()))
        temp.append(String("/"))
        temp.append(String(quizModule.GiveTotalQuestionCount()))
        
        CountLabel.text = temp
    }
    func setQuestion() {
        QuestionLabel.text = quizModule.GiveCurrentQuestion().GiveQuestion()
    }
    func chooseAnswer() {
        quizModule.InputAnswer(input: quizModule.GiveCurrentQuestion().CheckAns(input: answerCheck))
        quizModule.Count(input: answerCheck)
        settup(check: quizModule.MoveToNextQuestion())
    }
    func setChoices () {
        quizAnswerList = quizModule.GiveCurrentQuestion().GiveChoice()
        answerCheck = quizAnswerList[0]
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "QuizToEnd") {
            let seg = segue.destination as! EndViewController
            seg.quizModule = self.quizModule
        }
        
    }

}
