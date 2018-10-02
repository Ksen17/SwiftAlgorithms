import Foundation

//Basic data structure
class Tree<T: Comparable> {
    var value: T?
    //Left means smaller
    var left: Tree?
    //Right means bigger
    var right: Tree?
    
    //To expand our tree we need to add nodes
    func addNode(value: T) {
        //First of all we need to check if root of the tree is set
        if self.value == nil {
            //If not, or new value will be set as root
            self.value = value
            return
        }
        //Now let's check if it should go right or left
        if value < self.value! {
            //Now we should check if current node has left 'leaf'
            if self.left == nil {
                //It does not
                //Let's create it
                let newLeaf = Tree()
                //And set value
                newLeaf.value = value
                //Don't forget to assign new leaf to current node
                self.left = newLeaf
            } else {
                //It does
                //Use recursion to find place for new value
                self.left!.addNode(value: value)
            }
        } else if value > self.value! /*It can't be equal*/{
            //Now we should check if current node has right 'leaf'
            if self.right == nil {
                //It does not
                //Let's create it
                let newLeaf = Tree()
                //And set value
                newLeaf.value = value
                //Don't forget to assign new leaf to current node
                self.right = newLeaf
            } else {
                //It does
                //Use recursion to find place for new value
                self.right!.addNode(value: value)
            }
        }
    }
    
    //This function is used to find node which have specific value
    //In Big O notation this algorithm is O(log n)
    func findNode(value: T) -> Tree? {
        if self.value == nil {
            //If not, there is no node with such value
            return nil
        }
        //Now let's check if it on the right or on the left
        if value < self.value! {
            //Now we should check if current node has left 'leaf'
            if self.left == nil {
                //If not, there is no node with such value
                return nil
            } else {
                //It does
                //Use recursion to find node
                self.left!.findNode(value: value)
            }
        } else if value > self.value! {
            //Now we should check if current node has right 'leaf'
            if self.right == nil {
                //If not, there is no node with such value
                return nil
            } else {
                //It does
                //Use recursion to find node
                self.right!.findNode(value: value)
            }
        }
        //This node contains our value
        return self
    }
}

let tree = Tree<Int>()
tree.addNode(value: 5)
tree.addNode(value: 4)
tree.addNode(value: 2)
tree.addNode(value: 3)
tree.addNode(value: 8)
tree.addNode(value: 7)

if tree.findNode(value: 3) != nil {
    print("Tree have 3")
}


