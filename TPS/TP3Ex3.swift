// Déclaration de l'enum pour représenter les directions cardinales
enum Direction {
    case nord
    case sud
    case est
    case ouest

    // Méthode pour obtenir la direction opposée
    func opposee() -> Direction {
        switch self {
        case .nord:
            return .sud
        case .sud:
            return .nord
        case .est:
            return .ouest
        case .ouest:
            return .est
        }
    }
}

// Exemple d'utilisation de la méthode opposee
let direction = Direction.nord
let directionOpposee = direction.opposee()

print("Direction opposée à \(direction) est \(directionOpposee)")
