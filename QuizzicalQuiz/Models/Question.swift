//
//  Question.swift
//  QuizzicalQuiz
//
//  Created by Andrey Khakimov on 03.11.2021.
//

struct Qustion {
    let title: String
    let type: ResponseType
    let answers: [Answer]
    
    static func getQuestions() -> [Qustion] {
        [
            Qustion(
                title: "Какую пищу вы предпочитаете?",
                type: .single,
                answers: [
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .rabbit),
                    Answer(title: "Кукуруза", animal: .turtle),
                ]
            ),
            Qustion(
                title: "Что вам нравится больше?",
                type: .multiple,
                answers: [
                    Answer(title: "Плавать", animal: .turtle),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Размножаться", animal: .rabbit),
                    Answer(title: "Есть", animal: .dog),
                ]
            ),
            Qustion(
                title: "Любите ли вы поездки на машине?",
                type: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Нервничаю", animal: .rabbit),
                    Answer(title: "Не замечаю", animal: .turtle),
                    Answer(title: "Обожаю", animal: .dog),
                ]
            )
        ]
    }
}

struct Answer {
    let title: String
    let animal: Animal
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравятся быть с друзьями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь"
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество"
        case .rabbit:
            return "Э"
        case .turtle:
            return "ии"
        }
    }
}
