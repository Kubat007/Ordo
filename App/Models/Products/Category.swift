// Category.swift
struct Category: Codable {
    let id: String
    let name: String
    let isSelected: Bool
}

extension Category {
    static var mockData: [Category] {
        return [
            Category(id: "1", name: "Все", isSelected: true),
            Category(id: "2", name: "Соки и напитки", isSelected: false),
            Category(id: "3", name: "Овощи и фрукты", isSelected: false),
            Category(id: "4", name: "Мясо", isSelected: false),
            Category(id: "5", name: "Крупы", isSelected: false)
        ]
    }
}
