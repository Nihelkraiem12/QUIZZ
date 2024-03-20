// Struct Livre
struct Livre {
    var titre: String
    var auteur: String
    var codeISBN: String
    var disponible: Bool = true

    init(titre: String, auteur: String, codeISBN: String) {
        self.titre = titre
        self.auteur = auteur
        self.codeISBN = codeISBN
    }
}

// Struct Utilisateur
struct Utilisateur {
    var nom: String
    var id: String
    var livresEmpruntes: [String] = []

    mutating func livreEmprunte(isbn: String) {
        livresEmpruntes.append(isbn)
    }

    mutating func livreRetour(isbn: String) {
        if let index = livresEmpruntes.firstIndex(of: isbn) {
            livresEmpruntes.remove(at: index)
        }
    }
}

// Struct Bibliothèque
struct Bibliotheque {
    var livres: [String: Livre] = [:]
    var utilisateurs: [String: Utilisateur] = [:]

    mutating func ajoutLivre(livre: Livre) {
        livres[livre.codeISBN] = livre
    }

    mutating func enregistrerUtilisateur(utilisateur: Utilisateur) {
        utilisateurs[utilisateur.id] = utilisateur
    }

    mutating func prendreLivre(isbn: String, utilisateurId: String) {
        guard let livre = livres[isbn], var utilisateur = utilisateurs[utilisateurId] else {
            print("Livre ou utilisateur non trouvé.")
            return
        }

        if livre.disponible {
            utilisateur.livreEmprunte(isbn: isbn)
            livres[isbn]?.disponible = false
            utilisateurs[utilisateurId] = utilisateur
            print("L'utilisateur \(utilisateur.nom) a emprunté le livre \(livre.titre).")
        } else {
            print("Le livre \(livre.titre) n'est pas disponible pour l'emprunt.")
        }
    }

    mutating func livreRetour(isbn: String, utilisateurId: String) {
        guard var utilisateur = utilisateurs[utilisateurId], let livre = livres[isbn] else {
            print("Livre ou utilisateur non trouvé.")
            return
        }

        utilisateur.livreRetour(isbn: isbn)
        livres[isbn]?.disponible = true
        utilisateurs[utilisateurId] = utilisateur
        print("L'utilisateur \(utilisateur.nom) a retourné le livre \(livre.titre).")
    }
}

// Exemple d'utilisation
var bibliotheque = Bibliotheque()

// Ajout de livres à la bibliothèque
let livre1 = Livre(titre: "Harry Potter à l'école des sorciers", auteur: "J.K. Rowling", codeISBN: "9782070584620")
let livre2 = Livre(titre: "Le Seigneur des Anneaux: La Communauté de l'Anneau", auteur: "J.R.R. Tolkien", codeISBN: "9782070612361")
bibliotheque.ajoutLivre(livre: livre1)
bibliotheque.ajoutLivre(livre: livre2)

// Enregistrement des utilisateurs
let utilisateur1 = Utilisateur(nom: "Alice", id: "001")
let utilisateur2 = Utilisateur(nom: "Bob", id: "002")
bibliotheque.enregistrerUtilisateur(utilisateur: utilisateur1)
bibliotheque.enregistrerUtilisateur(utilisateur: utilisateur2)

// Emprunt et retour de livres
bibliotheque.prendreLivre(isbn: "9782070584620", utilisateurId: "001")
bibliotheque.prendreLivre(isbn: "9782070612361", utilisateurId: "002")
bibliotheque.livreRetour(isbn: "9782070584620", utilisateurId: "001")

// Affichage du statut des livres et des détails des utilisateurs
print("Statut des livres :")
for (_, livre) in bibliotheque.livres {
    let statut = livre.disponible ? "Disponible" : "Emprunté"
    print("- \(livre.titre) (\(livre.codeISBN)) : \(statut)")
}

print("\nDétails des utilisateurs :")
for (_, utilisateur) in bibliotheque.utilisateurs {
    print("- Utilisateur \(utilisateur.nom) (ID: \(utilisateur.id))")
    print("  Livres empruntés : \(utilisateur.livresEmpruntes)")
}
