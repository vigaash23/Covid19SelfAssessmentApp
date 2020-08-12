//
//  quiz.swift
//  covid19
//
//  Created by Vigaash Sivasothy on 2020-05-25.
//  Copyright © 2020 Vigaash Sivasothy. All rights reserved.
//

import Foundation

class Quiz {
    private var questionList: [Question]
    private var currentQuestion: Int
    private var correctCount: Int
    private var incorrectCount: Int
    private var num: Int
    
    
    init() {
        currentQuestion = 0
        correctCount = 0
        incorrectCount = 0
        num = 0
        questionList = [
            Question.init(que: "How old are you?", ans: "69 +", c1: "69 +", c2: "1 - 19", c3: "20 - 39", c4: "40 - 69"),
            Question.init(que: "What is your exposure to a nursing home or a long term care facility?", ans: "I currently reside in one", c1: "I currently reside in one", c2: "I have visited one in the past two weeks", c3: "I have little contact with a nursing home or a long term care facility (ex. Food delivery driver to a nursing home)", c4: "I do not have any contact"),
            Question.init(que: "What is your current work situation?", ans: "I am a frontline worker", c1: "I am a frontline worker", c2: "I am not a frontline worker, however I work outside of my home", c3: "I currently work from home", c4: "Unemployed/Layed Off"),
            Question.init(que: "Have you had underlying medical conditions (ex. chronic lung disease or moderate to severe asthma,  serious heart conditions, severe obesity, diabetes, chronic kidney disease undergoing dialysis, liver disease)?", ans: "Yes, I do", c1: "Yes, I do", c2: "I do not but I live with someone who does", c3: "I did in the past, not anymore", c4: "I don't, and those who I am most exposed to do not either"),
            Question.init(que: "Are you immunocompromised (Many conditions can cause a person to be immunocompromised, including cancer treatment, smoking, bone marrow or organ transplantation, immune deficiencies, poorly controlled HIV or AIDS, and prolonged use of corticosteroids and other immune weakening medications)?", ans: "I have been diagnosed by a health professional", c1: "I have been diagnosed by a health professional", c2: "I have not been professionally diagnosed but using my best judgement, I feel that I am immunocompromised", c3: "I am not, however I am in high contact with someone who is", c4: "No, I am not and I do not have high contact with someone who is"),
            Question.init(que: "Have you displayed and of the following symptoms : Fever or chills, Cough, Shortness of breath or difficulty breathing, Fatigue, Muscle or body aches, Headache, New loss of taste or smell, Sore throat, Congestion or runny nose, Nausea or vomiting, Diarrhea", ans: "Multiple Symptoms", c1: "Multiple Symptoms", c2: "A few symptoms", c3: "One symptom", c4: "None of the Above")]
    }
    func GiveCurrentQuestion () -> Question {
        return questionList[currentQuestion]
    }
    
    func InputAnswer (input: Bool) {
        if(input) {
            correctCount += 1
        }
        else {
            incorrectCount += 1
        }
    }
    
    func Count (input: String) {
        
        if (input == questionList[currentQuestion].GiveChoice()[0]) {
            num = num + 3
        }
        else if (input == questionList[currentQuestion].GiveChoice()[1]) {
            num = num + 2
        }
        else if (input == questionList[currentQuestion].GiveChoice()[2]) {
            num = num + 1
        }
        
    }
    
    
    func MoveToNextQuestion () -> Bool {
        if (currentQuestion == questionList.count - 1) {
            return false
        }
        else {
            currentQuestion += 1
            return true
        }
    }
    func GiveScore () -> Int {
        return num
    }
    func GiveTotalQuestionCount () -> Int {
        return questionList.count
    }
    
    func GiveTotalIncorrectCount () -> Int {
        return incorrectCount
    }
 
    func GiveCurrentQuestionValue () -> Int {
        return currentQuestion + 1
    }
    
    func GiveCorrectCount () -> Int {
        return correctCount
    }
    
    func reset() {
        currentQuestion = 0
        correctCount = 0
        incorrectCount = 0
        num = 0
    }
    
}

