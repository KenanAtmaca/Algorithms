class BinaryTree {
    
    var leftChild:BinaryTree?
    var rightChild:BinaryTree?
    var value:Int
    
    init(value:Int, leftChild:BinaryTree?, rightChild:BinaryTree?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }

}

//      7
//     / \
//    3   15
//   /   /  \
//  1    11  21
//      / \
//      8  19

// LEFT Branch

let child_1 = BinaryTree(value: 1, leftChild: nil, rightChild: nil)
let child_3 = BinaryTree(value: 3, leftChild: child_1, rightChild: nil)

// RİGHT Branch
let child_8 = BinaryTree(value: 8, leftChild: nil, rightChild: nil)
let child_19 = BinaryTree(value: 19, leftChild: nil, rightChild: nil)
let child_11 = BinaryTree(value: 11, leftChild: child_8, rightChild: child_19)
let child_21 = BinaryTree(value: 21, leftChild: nil, rightChild: nil)
let child_15 = BinaryTree(value: 15, leftChild: child_11, rightChild: child_21)

let root = BinaryTree(value: 7, leftChild: child_3, rightChild: child_15)

extension BinaryTree {
    class func search(value:Int,node:BinaryTree?) -> Bool {
        
        if node == nil {
            return false
        }
        
        if node?.value == value {
            return true
        } else if value < (node?.value)! {
            return search(value: value, node: node?.leftChild)
        } else {
            return search(value: value, node: node?.rightChild)
        }
        
    }
}

BinaryTree.search(value: 8, node: root) // true
BinaryTree.search(value: 31, node: root) // false
