// Struct Livre
struct Livre {
    var titre: String
    var auteur: String
    var codeISBN: String
    var disponible: Bool

    init(titre: String, auteur: String, codeISBN: String) {
        self.titre = titre
        self.auteur = auteur
        self.codeISBN = codeISBN
        self.disponible = true
    }
}

// Struct Utilisateur
struct Utilisateur {
    var nom: String
    var id: String
    var livresEmpruntes: [String]

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
    var livres: [String: Livre]
    var utilisateurs: [String: Utilisateur]

    mutating func ajoutLivre(livre: Livre) {
        livres[livre.codeISBN] = livre
    }

    mutating func enregistrerUtilisateur(utilisateur: Utilisateur) {
        utilisateurs[utilisateur.id] = utilisateur
    }

    mutating func prendreLivre(isbn: String, utilisateurId: String) {
        guard var utilisateur = utilisateurs[utilisateurId], var livre = livres[isbn] else {
            print("L'utilisateur ou le livre n'existe pas.")
            return
        }

        if livre.disponible {
            utilisateur.livreEmprunte(isbn: isbn)
            livre.disponible = false
            utilisateurs[utilisateurId] = utilisateur
            livres[isbn] = livre
            print("Le livre \(livre.titre) a été emprunté avec succès par \(utilisateur.nom).")
        } else {
            print("Le livre n'est pas disponible pour l'emprunt.")
        }
    }

    mutating func livreRetour(isbn: String, utilisateurId: String) {
        guard var utilisateur = utilisateurs[utilisateurId], var livre = livres[isbn] else {
            print("L'utilisateur ou le livre n'existe pas.")
            return
        }

        if utilisateur.livresEmpruntes.contains(isbn) {
            utilisateur.livreRetour(isbn: isbn)
            livre.disponible = true
            utilisateurs[utilisateurId] = utilisateur
            livres[isbn] = livre
            print("Le livre \(livre.titre) a été retourné avec succès par \(utilisateur.nom).")
        } else {
            print("Ce livre n'a pas été emprunté par cet utilisateur.")
        }
    }

    func listeLivresDisponibles() {
        print("Livres disponibles à l'emprunt :")
        for (isbn, livre) in livres {
            if livre.disponible {
                print("- \(livre.titre) (ISBN: \(isbn))")
            }
        }
    }

    func listeLivresEmpruntes(utilisateurId: String) {
        guard let utilisateur = utilisateurs[utilisateurId] else {
            print("L'utilisateur n'existe pas.")
            return
        }

        print("Livres empruntés par \(utilisateur.nom) :")
        for isbn in utilisateur.livresEmpruntes {
            if let livre = livres[isbn] {
                print("- \(livre.titre) (ISBN: \(isbn))")
            }
        }
    }
}

// Application Console
var bibliotheque = Bibliotheque(livres: [:], utilisateurs: [:])

// Initialisation et remplissage des données (prédéfinies)
let livre1 = Livre(titre: "Le Seigneur des Anneaux", auteur: "J.R.R. Tolkien", codeISBN: "978-2070612881")
let livre2 = Livre(titre: "Harry Potter à l'école des sorciers", auteur: "J.K. Rowling", codeISBN: "978-2070541279")
bibliotheque.ajoutLivre(livre: livre1)
bibliotheque.ajoutLivre(livre: livre2)

let utilisateur1 = Utilisateur(nom: "Alice", id: "001", livresEmpruntes: [])
let utilisateur2 = Utilisateur(nom: "Bob", id: "002", livresEmpruntes: [])
bibliotheque.enregistrerUtilisateur(utilisateur: utilisateur1)
bibliotheque.enregistrerUtilisateur(utilisateur: utilisateur2)

// Interaction de l'utilisateur (exemples)
bibliotheque.listeLivresDisponibles()
bibliotheque.prendreLivre(isbn: "978-2070612881", utilisateurId: "001")
bibliotheque.prendreLivre(isbn: "978-2070541279", utilisateurId: "002")
bibliotheque.listeLivresEmpruntes(utilisateurId: "001")
bibliotheque.listeLivresEmpruntes(utilisateurId: "002")
bibliotheque.livreRetour(isbn: "978-2070612881", utilisateurId: "001")
bibliotheque.listeLivresDisponibles()
