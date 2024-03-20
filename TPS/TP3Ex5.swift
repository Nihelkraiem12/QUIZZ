// Déclaration de l'enum pour représenter les différentes catégories de produits
enum Categorie {
    case electronique(String)
    case vetements
    case epicerie
}
// Déclaration de la struct pour représenter un produit
struct Produit {
    var nom: String
    var categorie: Categorie

    // Méthode pour obtenir la description du produit
    func description() -> String {
        switch categorie {
        case .electronique(let sousType):
            return "\(nom) - Catégorie: Électronique, Sous-type: \(sousType)"
        case .vetements:
            return "\(nom) - Catégorie: Vêtements"
        case .epicerie:
            return "\(nom) - Catégorie: Épicerie"
        }
    }
}
// Exemple d'utilisation de la struct Produit et de sa méthode description()
let produit1 = Produit(nom: "iPhone", categorie: .electronique("Mobile"))
let produit2 = Produit(nom: "T-shirt", categorie: .vetements)
let produit3 = Produit(nom: "Pomme", categorie: .epicerie)

print(produit1.description())
print(produit2.description())
print(produit3.description())
