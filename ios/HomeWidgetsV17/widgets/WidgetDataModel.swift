struct Today: Codable {
    let word: String?
    let score: String?
    let scoreName: String?
    
    enum CodingKeys: String, CodingKey {
        case word
        case score
        case scoreName = "score_name"
    }
}

struct Direction: Codable {
    let name: String?
    let contents: String?
}

struct Colors: Codable {
    let name: String
    let contents: String
}

struct Number: Codable {
    let name: String
    let contents: String
}

struct Item: Codable {
    let direction: Direction
    let color: Colors
    let number: Number
}

struct WidgetData: Codable {
    let today: [Today]?
    let item: Item?
    let fortune: Fortunes?
}

struct Love: Codable {
    let name: String
    let contents: String
}

struct Money: Codable {
    let name: String
    let contents: String
}

struct Health: Codable {
    let name: String
    let contents: String
}

struct Study: Codable {
    let name: String
    let contents: String
}

struct Work: Codable {
    let name: String
    let contents: String
}

struct Fortunes: Codable {
    let love: Love
    let money: Money
    let health: Health
    let study: Study
    let work: Work
}

