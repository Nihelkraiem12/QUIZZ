
var myNumber: Int=2
let myConst: Int=3

print("hello word")

// let input=readLine() -------------> lire au clavier

func getInput() -> String? {
    let input = readLine()
    return input
}

let input = getInput() // apple de la fonction 



var myNumber: String

func exercice(x: Int)  ->  String{
    if x%2==0 {
        return "pair"}
    else {
        return "impair"}
}

/*myNumber=exercice(x:6)
print(myNumber)

myNumber=exercice(x:3)
print(myNumber)



func maxNumber(x1: Int, x2: Int) -> Int? { // tjr mettre ? quand pas sure que ca va retourner un int
    if x1<x2 {
        return x2
    }
    else if x1>x2 {
        return x1
    }
    else {
        return nil
    }
}

if let number: Int = maxNumber(x1:3, x2:3) {
    print(number)
}
else {
    print("egaux")
}*/

/*let nom = readLine()
print("hello  \(nom!) !")    // \(nom!) veux dire la variable*/