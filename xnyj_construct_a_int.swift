import Foundation

// Chatbot Generator Data Model

struct Intent {
    let name: String
    var responses: [Response]
}

struct Response {
    let message: String
    var nextIntents: [Intent]?
}

struct Entity {
    let name: String
    var intents: [Intent]
}

struct Chatbot {
    let name: String
    var entities: [Entity]
    
    func generateChatbot() -> [Intent] {
        var intents: [Intent] = []
        for entity in entities {
            intents.append(contentsOf: entity.intents)
        }
        return intents
    }
}

// Example usage:
let intent1 = Intent(name: "Greeting", responses: [Response(message: "Hello! How can I assist you?", nextIntents: nil)])
let intent2 = Intent(name: "Goodbye", responses: [Response(message: "Goodbye! It was nice chatting with you.", nextIntents: nil)])

let entity1 = Entity(name: "Customer Support", intents: [intent1, intent2])

let chatbot = Chatbot(name: "MyChatbot", entities: [entity1])

let generatedChatbot = chatbot.generateChatbot()
print(generatedChatbot)