import Foundation
import XCTest

/*
 CheckBST
 https://www.hackerrank.com/challenges/ctci-is-binary-search-tree/problem
 
 Given the root node of a binary tree, determine if it is a binary search tree.
 
 The Node class is defined as follows:
    class Node {
        int data;
        Node left;
        Node right;
     }
*/

class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
}

func checkBST(root: Node?,min:Int?,max:Int?) -> Bool {
    
    guard let node = root else {return true}
    
    if min != nil && node.key <= min! {
        return false
    }
    
    if max != nil && node.key >= max! {
        return false
    }
 
    
    return checkBST(root: node.left, min: min, max: node.key) && checkBST(root: node.right, min: node.key, max: max)
        
}


