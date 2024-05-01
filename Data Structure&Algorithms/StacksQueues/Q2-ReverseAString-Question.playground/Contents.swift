import UIKit

// https://www.fullstack.cafe/interview-questions/stacks

/*
 Giving a String, write a function that reverses the String
 using a stack.
 */

func solution(_ text: String) -> String {
    
    guard !text.isEmpty else {return ""}
    
    var result = ""
    
    var arrayChar : [Character] = Array(text)
    
    for _ in 0..<arrayChar.count {
        
        result.append(arrayChar.removeLast())
    }
    
    return result
}

solution("abc") // cba
solution("Would you like to play a game?")
