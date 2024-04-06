// Importation de Foundation pour utiliser les types et les fonctionnalités de base de Swift
import Foundation

// Structure représentant une question
struct Question: Codable {
    let text: String             // Le texte de la question
    let choices: [String]       // Les choix possibles
    let correctAnswerIndex: Int // L'index de la réponse correcte parmi les choix
    let difficulty: String      // Le niveau de difficulté de la question
}

// Structure représentant une catégorie de questions
struct Category: Codable {
    let name: String            // Le nom de la catégorie
    let questions: [Question]  // Un tableau de questions appartenant à cette catégorie
}

// Classe pour gérer les données des catégories et des questions
class DataManager {
    // Propriété statique partagée pour accéder à une instance unique de DataManager
    static let shared = DataManager()

    // Tableau pour stocker les catégories chargées à partir du fichier JSON
    var categories = [Category]()

    // Méthode privée pour initialiser DataManager (constructeur privé pour le pattern Singleton)
    private init() {
        // Charger les catégories depuis le fichier JSON lors de l'initialisation de l'instance
        loadCategories()
    }

    // Méthode privée pour charger les catégories depuis le fichier JSON
  private func loadCategories() {
    // Obtenir le chemin d'accès au fichier JSON dans le bundle principal
  let fileManager = FileManager.default
  let currentPath = fileManager.currentDirectoryPath
  let fileURL = URL(fileURLWithPath: currentPath).appendingPathComponent("questions.json")

        do {
            // Lire les données du fichier JSON
            let data = try Data(contentsOf: fileURL)
            // Décoder les données JSON en un tableau de catégories
            categories = try JSONDecoder().decode([Category].self, from: data)
        } catch {
            // En cas d'erreur lors de la lecture ou du décodage du fichier JSON, afficher une erreur fatale avec des détails
            fatalError("Erreur lors de la lecture du fichier JSON : \(error)")
        }
    }
}
 
// Obtention de l'instance partagée du DataManager
let dataManager = DataManager.shared

// Affichage des catégories disponibles
print("╔══════════════════════════╗")
print("║Catégories disponibles    ║")
print("╠══════════════════════════╣")
for (index, category) in dataManager.categories.enumerated() {
    print("║ \(index + 1). \(category.name.padding(toLength: 22, withPad: " ", startingAt: 0)) ║")
}
print("╚══════════════════════════╝")


// Demande à l'utilisateur de choisir une catégorie
print("Choisissez une catégorie (1-\(dataManager.categories.count)) : ")
if let userInput = readLine(),
   let selectedCategoryIndex = Int(userInput),
   selectedCategoryIndex > 0,
   selectedCategoryIndex <= dataManager.categories.count {

    // Récupération de la catégorie sélectionnée par l'utilisateur
    let selectedCategory = dataManager.categories[selectedCategoryIndex - 1]

    // Affichage des questions de la catégorie sélectionnée
    print("Questions de la catégorie \(selectedCategory.name) :")
    var score = 0 // Initialisation du score de l'utilisateur
    for (index, question) in selectedCategory.questions.enumerated() {
        print("Question \(index + 1): \(question.text)")
        print("Choix : \(question.choices)")
        print("Difficulté : \(question.difficulty)")
        print("Entrez le numéro de votre réponse : ")
        if let userAnswer = readLine(), let answerIndex = Int(userAnswer) {
            if answerIndex - 1 == question.correctAnswerIndex {
                print("Correct!")
                score += 1 // Incrémenter le score si la réponse est correcte
            } else {
                print("Incorrect.")
            }
        } else {
            print("Entrée invalide.")
        }
        print("") // Saut de ligne pour la lisibilité
    }
    // Afficher le score final
    print("Votre score final est de \(score) sur \(selectedCategory.questions.count).")

} else {
    // Affichage d'un message en cas d'entrée invalide
    print("Entrée invalide.")
}

