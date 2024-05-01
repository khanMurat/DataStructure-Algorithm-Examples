import UIKit

/*
 Write a function that determines the length of any linked list.
 */

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func length2(_ head: Node?) -> Int {
    
    if head == nil {
        return 0
    }
    
    var index = 0
    var node = head
    
    while (node != nil) {
        index += 1
        node = node?.next
    }
    
    return index
}

// 1 2 3 4 5 6
let node6 = Node(6)
let node5 = Node(5, node6)
let node4 = Node(4, node5)
let node3 = Node(3, node4)
let node2 = Node(2, node3)
let node1 = Node(1, node2)

length2(nil) // 0
length2(node1) // 6
