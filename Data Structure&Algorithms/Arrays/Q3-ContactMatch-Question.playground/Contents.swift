import Foundation

/*
 When someone searches their contacts based on a phone number, it's nice when a list
 of contact pops up.
 
 Write an algorithm that searches you contacts for phone number strings, and returns:
  - NO CONTACT if contact can't be found
  - A contact if a contact is found
  - The first alphabetized contact if there are multiple
 
 A = ["pim", "pom"]             // Contacts (return one of these)
 B = ["999999999", "777888999"] // Phone numbers for each contact A[i] = B[i]
 P = "88999"                    // Search phrase

 Answer should be correct. Don't worry about performance.
 */


public func solution(_ A : [String], _ B : [String], _ P : String) -> String {
    
    guard !A.isEmpty else {return ""}
    guard B.count != 0 else {return ""}
    
    var dict : [String:String] = [:]
    var finalArray = [String]()
    
    for i in 0...A.count - 1 {
        
        dict[B[i]] = A[i]
    }
    
    var phones = Array<String>(dict.keys)
    
    var x = phones.filter { str in
        str.contains(P)
    }
    
    if x.isEmpty {
        return "NO CONTACT"
    }
    
    for str in x {
        
        if dict[str] != nil {
            
            finalArray.append(dict[str]!)
        }
    }
    
    return finalArray.sorted()[0]
}



public func solution2(_ A : [String], _ B : [String], _ P : String) -> String {
    
    var result = [String]()
    
    for i in 0..<B.count{
        
        if B[i].contains(P) {
            
            result.append(A[i])
        }
    }
    
    if result.count == 0 {
        
        return "No Contact"
    }
    
    return result.sorted().first ?? ""
}

let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"

solution(A, B, P)   // pom
solution2(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")  // ann
solution(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112")   // NO CONTACT

// edge cases
solution([String](), [String](), "")
solution(A, B, "")




