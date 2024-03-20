// Déclaration de l'enum pour représenter les jours de la semaine
enum JourSemaine {
    case lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche
}

// Définition de la fonction leWeekend qui vérifie si le jour est un weekend
func leWeekend(jour: JourSemaine) -> Bool {
    switch jour {
    case .samedi, .dimanche:
        return true
    default:
        return false
    }
}

// Exemples d'utilisation de la fonction
let jour1 = JourSemaine.lundi
let jour2 = JourSemaine.samedi

print(leWeekend(jour: jour1)) // false
print(leWeekend(jour: jour2)) // true
