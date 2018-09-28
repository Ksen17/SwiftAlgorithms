import UIKit

//Data node
class Node: NSObject {
    //Value of current node
    var key: Int?
    //Link to next node in chain of nodes
    var next: Node?
    //Link to previous node in chain of nodes
    var previous: Node?
}

//LinkedList itself
class LinkedList: NSObject {
    //Starting point of the chain
    private var head: Node = Node()
    
    //Function to print all values of all elements of the chain
    func printKeys() {
        //Get starting point of list
        var current: Node! = head
        //In the loop we iterate over all nodes in the chain
        while current != nil {
            print("Current key = \(String(describing: current!.key!))")
            //Go to the next node
            current = current!.next
        }
    }
    
    //Function to add new values to the chain
    func addNewValue(key: Int) {
        //First of all we need to check maybe we have not set list starting point
        if head.key == nil {
            //So we should set it
            head.key = key
            return
        }
        //If first value is already set we should find the last one
        //Get starting point of list
        var current: Node? = head
        //In the loop we iterate over all nodes in the chain
        while current != nil {
            //Check if this node is the last
            if current?.next == nil{
                //Setup new node
                let newNode = Node()
                //Set the value to the new node
                newNode.key = key
                //Next two lines perform the linking in the list
                newNode.previous = current
                current?.next = newNode
                break
            }
            //Go forward
            current = current?.next
        }
    }
    
    //Function which is used to remove node from specific index
    func removeAtIndex(index:Int) {
        //Get starting point of list
        var current: Node? = head
        //This value will be used to remember pevious node
        var trailer: Node?
        //Iterator
        var listIndex = 0
        //First of all we need to check if node we should delete is our first node
        if index == 0 {
            //If true
            //We set the second value in our list as current
            current = current?.next
            //Then we set current as our starting node
            head = current!
            return
        }
        //In the loop we iterate over all nodes in the chain
        while current != nil {
            //Check if we need to remove this node
            if index == listIndex {
                //Next three lines are used to remove current node from the chain
                //First we need te reattach links between previous and next nodes
                trailer?.next = current?.next
                current?.next?.previous = trailer
                //Now we can delete current node
                current = nil
                break
            }
            //Remember our current node as previous
            trailer = current
            //Go to the next node
            current = current?.next
            //Update the iterator
            listIndex = listIndex + 1
        }
    }
}

//Testing
let list = LinkedList()
list.addNewValue(key: 0)
list.addNewValue(key: 1)
list.addNewValue(key: 2)
list.removeAtIndex(index: 1)
list.printKeys()
