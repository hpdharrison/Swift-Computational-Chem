import Foundation
func equationInput(input: String) {
    // Split a reaction formula over the reaction symbol
    // Support ONLY for forwards reactions
    //var digestedEquation: [[[Int, String]]] = []
    let reactantsProductsArray = input.components(separatedBy: "->")
    let reactants = reactantsProductsArray[0]
    let products = reactantsProductsArray[1]
    let reactantsArray = reactants.components(separatedBy: "+")
    let productsArray = products.components(separatedBy: "+")
    print("Reactants Array: \(reactantsArray)")
    print("Products Array: \(productsArray)")
}
print("Reaction Equation: ", terminator: "")
let input = readLine()
let eq = input!
equationInput(input: eq)