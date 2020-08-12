//
//  question.swift
//  covid19
//
//  Created by Vigaash Sivasothy on 2020-05-25.
//  Copyright © 2020 Vigaash Sivasothy. All rights reserved.
//

import Foundation

class Question {
    private var question: String
    private var answer: String
    private var choice1: String
    private var choice2: String
    private var choice3: String
    private var choice4: String
    private var num: Int
    
    init() {
        question = "Has this question been properly set up?"
        answer = "NO"
        choice1 = "NO"
        choice2 = "YES"
        choice3 = "YES"
        choice4 = "YES"
        num = 0
    }
    init(que: String, ans: String, c1: String, c2: String, c3: String, c4: String)
    {
        question = que
        answer = ans
        choice1 = c1
        choice2 = c2
        choice3 = c3
        choice4 = c4
        num = 0
    }
    
    //Custom Functions
    func GiveChoice () -> [String] {
        var temp: [String] = []
        temp.append(choice1)
        temp.append(choice2)
        temp.append(choice3)
        temp.append(choice4)
        
        return temp
    }
    
    func CheckAns (input: String) -> Bool {
        
        if (input == answer) {
            return true
        }
        else {
            return false
        }
        
    }
    
    
    
    func GiveQuestion () -> String {
        return question
    }
    
    
        
    
}
