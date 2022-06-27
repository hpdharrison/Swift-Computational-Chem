import Foundation
import Darwin
func equationInput(input: String) -> [[String]]{
    // Split a reaction formula over the reaction symbol
    // Support ONLY for forwards reactions
    let reactantsProductsArray = input.components(separatedBy: "->")
    let reactants = reactantsProductsArray[0]
    let products = reactantsProductsArray[1]
    let reactantsArray = reactants.components(separatedBy: "+")
    let productsArray = products.components(separatedBy: "+")
    //print("Reactants Array: \(reactantsArray)")
    //print("Products Array: \(productsArray)")
    return [reactantsArray, productsArray]
}
func extractMoles(targetMole: String) -> Int {
    let regex = try! NSRegularExpression(pattern: "(\\d*)(.+)", options: []) // Set up Regex pattern
    let range = NSRange(
        targetMole.startIndex..<targetMole.endIndex,
        in: targetMole
    ) // Create Regex object
    let matches = regex.matches(in: targetMole, options: [], range: range)
    let match = matches.first!

    let molesInt = Int(targetMole[Range(match.range(at: 1), in: targetMole)!])!
    //let equationString = String(targetMole[Range(match.range(at: 2), in: targetMole)!])

    return molesInt
}

print("Reaction: ", terminator: "")
let input = readLine()
let target = input!
let components = equationInput(input: target)
for molecule in components[0] {
    let moles = extractMoles(targetMole: molecule)
    print("\(moles)mol of \(molecule)")
}