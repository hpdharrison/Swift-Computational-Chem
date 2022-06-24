import Foundation
import Darwin
// Calculate the position of a particle after an amount of time from a dpecific starting position and assuming constant velocity
func position(current: [Float], velocity: Float, time: Float) -> [Float] {
    let directionDegree = Float.random(in: 0...360)
    let displacementAbsoloute = velocity * time
    let conv = Float.pi/180
    var positionFinal: [Float] = [0.0, 0.0]
    var trajectory: Float
    if 0 < directionDegree, directionDegree < 90 {  
        let displacementHorizontal = sin(directionDegree*conv)*displacementAbsoloute
        let displacementVertical = cos(directionDegree*conv)*displacementAbsoloute
        positionFinal = [current[0]+displacementHorizontal, current[1]+displacementVertical]
    } else if 90 < directionDegree, directionDegree < 180 {
        trajectory = directionDegree - 90
        let displacementHorizontal = cos(trajectory*conv)*displacementAbsoloute
        let displacementVertical = sin(trajectory*conv)*displacementAbsoloute
        positionFinal = [current[0]+displacementHorizontal, current[1]-displacementVertical]
    } else if 180 < directionDegree, directionDegree < 270{
        trajectory = directionDegree - 180
        let displacementHorizontal = sin(trajectory*conv)*displacementAbsoloute
        let displacementVertical = cos(trajectory*conv)*displacementAbsoloute
        positionFinal = [current[0]-displacementHorizontal, current[1]-displacementVertical]
    } else if 270 < directionDegree, directionDegree < 360{
        trajectory = directionDegree - 270
        let displacementHorizontal = cos(trajectory*conv)*displacementAbsoloute
        let displacementVertical = sin(trajectory*conv)*displacementAbsoloute
        positionFinal = [current[0]-displacementHorizontal, current[1]+displacementVertical]
    }
    return positionFinal
}
// Modification of position function to model for multiple particles
func multiParticleTrack(currentPositions: [[Float]], velocity: Float, time: Float) -> [[Float]] {
    var positionFinal: [[Float]] = []
    for pos in currentPositions {
        positionFinal.append(position(current: pos, velocity: velocity, time: time))
    }
    return positionFinal
}
// Gets internal URL for log file to write out to
func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}
// Write out the position log file
func positionLogWriteOut(logEntry: String, fileName: String) {
    let file = getDocumentsDirectory().appendingPathComponent(fileName)
    do {
        try logEntry.write(to: file, atomically: true, encoding: String.Encoding.utf8)
    } catch {
        print("Error writing out to file")
    }
}

/*

The following snippet models the movement of 6 distinct particles using a brownian motion model as defined by the function "multiParticleTrack(currentPositions:, velocity:, time:)"
The simulation calculates the positions of every particle assuming a constant velocity takinf a "frame" every 0.2 seconds as defined by the time parameter. This therefore models their
movement over a period of 200 seconds.

var writeOut: String = ""
var continualPostion: [[Float]] = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]
for i in 1...1000{
    var out: String = "@Time = \(Float(i)*0.2): "
    continualPostion = multiParticleTrack(currentPositions: continualPostion, velocity: 1.2, time: 0.2)
    for particle in 0...continualPostion.count-1 {
        out += "Particle \(particle) Position: \(continualPostion[particle]), "
    }
    print(out)
    writeOut += "\(out) \n"
}
positionLogWriteOut(logEntry: writeOut, fileName: "Swift Projects/Computational Chem/particleMotion.log")
*/