import UIKit

class Node<Item> {
    let value: Item
    var next: Node?
    
    init(value: Item) {
        self.value = value
        self.next = nil
    }
}

class LinkedList<Item> {
    var head: Node<Item>?
    private var tail: Node<Item>?
    
    var first: Node<Item>? {
        return head
    }
    
    var last: Node<Item>? {
        return tail
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    var count: Int {
        var currentNode = head
        var counter = 0
        
        while currentNode != nil {
            counter += 1
            currentNode = currentNode?.next
        }
        
        return counter
    }
    
    func append(value: Item) {
        let newNode = Node(value: value)
        
        if let tailNode = tail {
            tailNode.next = newNode
        } else {
            head = newNode
        }
        
        tail = newNode
    }
    
    func nodeAt(index: Int) -> Item? {
        assert(index >= 0, "Index cannot be less than zero!")
        
        var currentNode = head
        var i = index
        
        while currentNode != nil {
            if i == 0 {
                return currentNode?.value
            }
            i -= 1
            currentNode = currentNode?.next
        }
        
        return nil
    }
    
    func removeAt(index: Int) {
        assert(index >= 0, "Index cannot be less than zero!")
        
        var currentNode = head
        var i = index
        
        if index == 0 {
            head = head?.next
        } else {
            while currentNode != nil {
                if i == 1 {
                    currentNode?.next = currentNode?.next?.next
                }
                i -= 1
                currentNode = currentNode?.next
            }
        }
    }
    
    func removeAll() {
        head = nil
        tail = nil
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        let start = "Linked List: [HEAD] "
        var elements: [String] = []
        var currentNode = head
        
        while currentNode != nil {
            elements.append(String(describing: currentNode!.value))
            currentNode = currentNode?.next
        }
        
        let output = elements.joined(separator: " -> ")
        return start + output
    }
    
    func printLinkedList() {
        print(description)
    }
}

var linkedList: LinkedList = LinkedList<String>()
linkedList.append(value: "One")
linkedList.append(value: "Two")
linkedList.append(value: "Three")
linkedList.append(value: "Four")

linkedList.nodeAt(index: 2)
linkedList.removeAt(index: 0)

linkedList.first?.value
linkedList.last?.value
linkedList.isEmpty
linkedList.count

linkedList.printLinkedList()
