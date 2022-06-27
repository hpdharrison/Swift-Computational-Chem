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
    return [reactantsArray, productsArray]
}
func extractMoles(targetMole: String) -> [String] {
    let regex = try! NSRegularExpression(pattern: "(\\d*)(.+)", options: []) // Set up Regex pattern
    let range = NSRange(
        targetMole.startIndex..<targetMole.endIndex,
        in: targetMole
    ) // Create Regex object
    let matches = regex.matches(in: targetMole, options: [], range: range)
    let match = matches.first!
    let molesInt: Int
    let equationString: String
    if Int(targetMole.prefix(1)) == nil {
        molesInt = 1
        equationString = targetMole
    } else {
        molesInt = Int(targetMole[Range(match.range(at: 1), in: targetMole)!])!
        equationString = String(targetMole[Range(match.range(at: 2), in: targetMole)!])
    }
    return [String(molesInt), equationString]
}
func moleculeID(target: String) -> [[String]] {
    let regex = try! NSRegularExpression(pattern: "([A-Z][a-z]*)(\\d*)", options: [])
    let range = NSRange (
        target.startIndex..<target.endIndex,
        in: target
    )
    let matches = regex.matches(in: target, options: [], range: range)
    var seperation: [[String]] = []
    var breakdown: [String] = []
    for match in matches {
        breakdown = []
        for i in 1...match.numberOfRanges-1 {
            let attribute = target[Range(match.range(at: i), in: target)!]
            if attribute == "" {
                breakdown.append("1")
            } else {
                breakdown.append(String(attribute))
            }
        }
        seperation.append(breakdown)
    }
    return seperation
}

print("Reaction: ", terminator: "")
let input = readLine()
let target = input!
let components = equationInput(input: target)
print(components)
print("==REACTANTS==")
for molecule in components[0] {
    let moles = extractMoles(targetMole: molecule)
    print("==\(moles[0])mol of \(moles[1])==")
    print("Molecule Breakdown: ")
    print(moleculeID(target: moles[1]))
}
print("\n==PRODUCTS==")
for molecule in components[1] {
    let moles = extractMoles(targetMole: molecule)
    print("==\(moles[0])mol of \(moles[1])==")
    print("Molecule Breakdown: ")
    print(moleculeID(target: moles[1]))
}
