import Foundation

// Fonction pour obtenir une entrée utilisateur
func getInput(prompt: String) -> String? {
    print(prompt, terminator: ": ")
    return readLine()
}

// Inviter l'utilisateur à saisir son nom et prénom
if let fullName = getInput(prompt: "Entrez votre nom et prénom") {
    // Demander à l'utilisateur d'entrer son âge
    if let ageString = getInput(prompt: "Entrez votre âge") {
        // Convertir l'âge en entier
        if let age = Int(ageString) {
            // Demander à l'utilisateur quel mois il est né
            if let birthMonth = getInput(prompt: "Entrez le mois de votre naissance") {
                // Demander à l'utilisateur son numéro préféré
                if let favoriteNumberString = getInput(prompt: "Entrez votre numéro préféré") {
                    // Convertir le numéro préféré en entier
                    if let favoriteNumber = Int(favoriteNumberString) {
                        // Afficher les informations du profil
                        print("\nProfil de l'utilisateur:")
                        print("Nom et prénom: \(fullName)")
                        print("Âge: \(age) ans")
                        print("Mois de naissance: \(birthMonth)")
                        print("Numéro préféré: \(favoriteNumber)")
                    } else {
                        print("Erreur: Veuillez entrer un numéro valide.")
                    }
                } else {
                    print("Erreur: Entrée du numéro préféré invalide.")
                }
            } else {
                print("Erreur: Entrée du mois de naissance invalide.")
            }
        } else {
            print("Erreur: Veuillez entrer un âge valide.")
        }
    } else {
        print("Erreur: Entrée de l'âge invalide.")
    }
} else {
    print("Erreur: Entrée du nom et prénom invalide.")
}
