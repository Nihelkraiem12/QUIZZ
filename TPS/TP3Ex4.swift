// Déclaration de l'enum pour représenter les codes d'état HTTP
enum StatusCode: Int {
    case success = 200
    case notFound = 404

    // Méthode pour obtenir le nom du code d'état
    func description() -> String {
        switch self {
        case .success:
            return "Succès"
        case .notFound:
            return "Non trouvé"
        }
    }
}

// Exemple d'utilisation de la méthode description()
let code1 = StatusCode.success
let code2 = StatusCode.notFound

print("Code \(code1.rawValue) : \(code1.description())")
print("Code \(code2.rawValue) : \(code2.description())")
