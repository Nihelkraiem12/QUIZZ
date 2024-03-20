// Déclaration de l'enum pour représenter les différentes unités de température
enum Temperature {
    case celsius(Double)
    case fahrenheit(Double)
    case kelvin(Double)
}

// Définition de la fonction convertirEnCelsius pour convertir la température en Celsius
func convertirEnCelsius(temp: Temperature) -> Double {
    switch temp {
    case .celsius(let valeur):
        return valeur
    case .fahrenheit(let valeur):
        return (valeur - 32) * 5 / 9
    case .kelvin(let valeur):
        return valeur - 273.15
    }
}

// Exemples d'utilisation de la fonction
let temperature1 = Temperature.celsius(25.0)
let temperature2 = Temperature.fahrenheit(98.6)
let temperature3 = Temperature.kelvin(273.15)

print(convertirEnCelsius(temp: temperature1)) // 25.0
print(convertirEnCelsius(temp: temperature2)) // 37.0
print(convertirEnCelsius(temp: temperature3)) // 0.0