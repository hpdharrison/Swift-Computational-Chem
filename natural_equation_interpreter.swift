import Foundation
import Darwin

func findTotalMr(compound: [[Any]]) -> Float {
    // Imports periodic table CSV and processes it into a 2D array "pTable"
    var pTable: [[String]] = []
    var totalMr: Float = 0
    //var targetElement: String
    //var sRatio: Int
    let pTableImport = try! String(contentsOfFile: "periodic_table.csv")
    let pTableImportSplit = pTableImport.components(separatedBy: "\n")
    for line in pTableImportSplit {
        pTable.append(line.components(separatedBy: ","))
    }
    // Wvaluate Mr of compound
    for element in compound{
        var Mr: Float = 0
        for row in pTable{
            if row.count > 3{
                if row[2] == element[0] as! String {
                    Mr = (row[3] as NSString).floatValue
                }
            }
        }
        if Mr == 0 {print("Error in finding "+(element[0] as! String)+". Please check formula")}
            totalMr = totalMr + (Mr*(element[1] as! NSString).floatValue)
    }
    return totalMr
}

func equationInput(input: String) -> [[String]] {
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
    // PATTERN: (\d*)(.+)
    //  Capture Group 1: (\d*) - will capture prefixed numbers onto chemical compounds.
    //  Capture Group 2: (.+) - will capture the rest of the chemical compound formula.
    let regex = try! NSRegularExpression(pattern: "(\\d*)(.+)", options: [])
    let range = NSRange(
        targetMole.startIndex..<targetMole.endIndex,
        in: targetMole
    ) 
    
    // Create Regex object
    let matches = regex.matches(in: targetMole, options: [], range: range)
    let match = matches.first!

    // Sensible defaults, incase certain parts of regex cannot be extracted.
    let molesStr = targetMole[Range(match.range(at: 1), in: targetMole)!]
    var equationString = targetMole
    var molesInt: Int = 1

    if let attemptedMolesInt = Int(molesStr){
        // Since there is a prefixed number, data from capture groups needs to be used.
        molesInt = attemptedMolesInt
        equationString = String(targetMole[Range(match.range(at: 2), in: targetMole)!])
    }
    return [String(molesInt), equationString]
}

func moleculeID(target: String) -> [[String]] {
    // Regex pattern used for complex molecule formulas, e.g: H2SO4 or NaCl.
    // Complex formulas containing several elements will produce several matches.
    // PATTERN: ([A-Z][a-z]*)(\d*)
    //  Capture Group 1: ([A-Z][a-z]*)
    //      [A-Z] captures first capital letter, while [a-z]* captures the remaining lowercase letters.
    //  Capture Group 2: (\d*)
    //      \d will capture any trailing numbers indicating how many atoms there are in that compound.
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
    print("Total Mr of compound: ")
    print(findTotalMr(compound: moleculeID(target: moles[1])))
}
print("\n==PRODUCTS==")
for molecule in components[1] {
    let moles = extractMoles(targetMole: molecule)
    print("==\(moles[0])mol of \(moles[1])==")
    print("Molecule Breakdown: ")
    print(moleculeID(target: moles[1]))
    print("Total Mr of compound: ")
    print(findTotalMr(compound: moleculeID(target: moles[1])))
}
