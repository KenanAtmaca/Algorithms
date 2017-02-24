class Node<T> {
    
    var value:T
    var next:Node?
    
    init(value:T) {
        self.value = value
    }
    
}


class Stack<T> {
    
    var top:Node<T>?
    
    func push(_ value:T) {
        let oldTop = top
        top = Node(value: value)
        top?.next = oldTop
    }
    
    func pop() -> T? {
        let currentTop = top
        top = top?.next
        return currentTop?.value
    }
    
    func peak() -> T? {
        return top?.value
    }
    
}

let strStack = Stack<String>()
strStack.push("Kenan")
strStack.push("Ali")
strStack.push("Ahmet")
strStack.pop() // Ahmet
strStack.peak() // Ali

let intStack = Stack<Int>()
intStack.push(1245)
intStack.push(5337)
intStack.peak() // 5337

class student {
    var name:String!
    var sex:String!
    init(name:String,sex:String){
        self.name = name
        self.sex = sex
    }
}

let studentStack = Stack<student>()
studentStack.push(student(name: "Kenan", sex: "Male"))
studentStack.push(student(name: "Ayse", sex: "Famale"))

studentStack.peak()?.name // Ayse
