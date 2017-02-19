struct Student {
    var name:String?
    var gender:String?
    var age:Int?
    var no:Int?
}

class LinkedList {
    
    var next:LinkedList?
    var student:Student?
    var point:Int
    
    init (next:LinkedList?,student:Student?,point:Int) {
        self.next = next
        self.point = point
        self.student = student
    }

}

var students:[Student] = [Student(name: "Kenan", gender: "Male", age: 21, no: 1),Student(name: "Ali", gender: "Male", age: 28, no: 2),Student(name: "Defne", gender: "Famale", age: 18, no: 3)]


let student_three = LinkedList(next: nil, student: students[2], point: 65)
let student_two = LinkedList(next: student_three, student: students[1], point: 98)
let student_one = LinkedList(next: student_two, student: students[0], point: 71)


extension LinkedList {
    class func printNodes(snode:LinkedList?) {
        
        var curentNode = snode
        
        while curentNode != nil {
           print(curentNode?.student?.name ?? "nil")
            curentNode = curentNode?.next
        }
        
    }
}

LinkedList.printNodes(snode: student_one) // Kenan -> Ali -> Defne
