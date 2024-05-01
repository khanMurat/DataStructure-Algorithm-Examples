import UIKit

/*
 Find Merge Point of Two Lists

 Given pointers to the head nodes of 2 linked lists that merge together at some point, find the node where the two lists merge. The merge point is where both lists point to the same node, i.e. they reference the same memory location. It is guaranteed that the two head nodes will be different, and neither will be NULL. If the lists share a common node, return that node's data value.

 Note: After the merge point, both lists will share the same node pointers.
 
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length(_ head: Node?) -> Int {
    if head == nil {
        return 0
    }
    
    var len = 0
    var current = head
    while current != nil {
        len += 1
        current = current?.next
    }
    return len
}

func printLinkedList(_ head: Node?) {
    if head == nil { return }
    
    var result = [Int]()
    var node = head
    result.append(node!.data)
    
    while node?.next != nil {
        result.append(node!.next!.data)
        node = node?.next
    }
    
    print(result)
}

func findMerge(headA: Node?, headB: Node?) -> Int? {
    
    guard let headA = headA , let headB = headB else {return nil}
    
    let lengthA = length(headA)
    
    let lengthB = length(headB)
    
    
    if lengthA > lengthB {
        
        let abs = lengthA - lengthB
        
        var nodeA = headA
        var nodeB = headB
        
        for _ in 0..<abs {
            nodeA = nodeA.next!
        }
        
        for _ in 0..<lengthB {
            
            if nodeA.data == nodeB.data {
                return nodeA.data
            }else{
                nodeA = nodeA.next!
                nodeB = nodeB.next!
            }
        }
    }else{
        let abs = lengthB - lengthA
        
        var nodeA = headA
        var nodeB = headB
        
        for _ in 0..<abs {
            nodeB = nodeB.next!
        }
        
        for _ in 0..<lengthA {
            
            if nodeA.data == nodeB.data {
                return nodeA.data
            }else{
                nodeA = nodeA.next!
                nodeB = nodeB.next!
            }
        }
    }
    return nil
}


func findMerge2(headA: Node?, headB: Node?) -> Int? {
 
    let m = length(headA)
    let n = length(headB)
    
    var currentA = headA
    var currentB = headB
    
    var dict : [Int:Bool] = [:]
    
    for _ in 0...n-1{
        
        dict[currentB?.data ?? 0] = true
        
        currentB = currentB?.next
    }
    
    for _ in 0...m-1{
        
        if dict[currentA?.data ?? 0] == true {
            return currentA?.data
        }
        
        currentA = currentA?.next
    }
    
    print(dict)
    
    return nil

}

func findMergePoint(headA: Node?, headB: Node?) -> Int? {
    var currentA = headA
    var currentB = headB
    var lenA = length(headA)
    var lenB = length(headB)

    while lenA > lenB {
        currentA = currentA?.next
        lenA -= 1
    }
    while lenB > lenA {
        currentB = currentB?.next
        lenB -= 1
    }
    printLinkedList(currentA)
    printLinkedList(currentB)

    while currentA !== currentB {
        currentA = currentA?.next
        currentB = currentB?.next
    }

    return currentA?.data
}

func findMergePoint2(headA: Node?, headB: Node?) -> Int? {
    var currentA = headA
    var currentB = headB

    while currentA !== currentB {
        currentA = currentA == nil ? headB : currentA?.next
        currentB = currentB == nil ? headA : currentB?.next
    }

    return currentA?.data
}



// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

// 10 11 12 13 4 5 6
let node11 = Node(2, node4)
let node10 = Node(1, node11)

printLinkedList(node1)
printLinkedList(node10)

findMerge(headA: node1, headB: node10)

findMergePoint(headA: node1, headB: node10)
