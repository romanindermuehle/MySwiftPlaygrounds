// Handler (protocol)

// TODO: I don't understand how that Error protocol is working.
enum SupportResponse: CustomStringConvertible, Error {
    case ableToHelp(supportLevel: String)
    case unableToHelp(String)
    
    var description: String {
        switch self {
        case .ableToHelp(supportLevel: let text): return "\(text): I’m delighted to assist you in resolving your issue."
        case .unableToHelp(let text): return text
        }
    }
}

protocol SupportHandler {
    var nextHandler: SupportHandler? { get set }
    func handle(problem: String) -> String?
}

class Tier1Support: SupportHandler {
    var nextHandler: SupportHandler?
    
    func handle(problem: String) -> String? {
        if problem.lowercased().contains("password reset") {
            return SupportResponse.ableToHelp(supportLevel: "Tier 1 Support: I’m delighted to assist you in resolving your issue.").description
        }
        
        return nextHandler?.handle(problem: problem)
    }
}

class Tier2Support: SupportHandler {
    var nextHandler: SupportHandler?
    
    func handle(problem: String) -> String? {
        if problem.lowercased().contains("software crashes") {
            return SupportResponse.ableToHelp(supportLevel: "Tier 2 Support: I’m delighted to assist you in resolving your issue.").description
        }
        
        return nextHandler?.handle(problem: problem)
    }
}

class Tier3Support: SupportHandler {
    var nextHandler: SupportHandler?
    
    func handle(problem: String) -> String? {
        if problem.contains("server is down") {
            return SupportResponse.ableToHelp(supportLevel: "Tier 3 Support: I’m delighted to assist you in resolving your issue.").description
        }
        
        return nextHandler?.handle(problem: problem)
    }
}

func contactSupport(withProblem: String) throws -> String {
    let tier1Support = Tier1Support()
    let tier2Support = Tier2Support()
    let tier3Support = Tier3Support()

    tier1Support.nextHandler = tier2Support
    tier2Support.nextHandler = tier3Support
    
    guard let response = tier1Support.handle(problem: withProblem) else {
        throw SupportResponse.unableToHelp("Support was unable to help with the problem: \(withProblem)")
    }
    
    return response
}

let problem1 = "I would like to do a password reset."
let problem2 = "My software crashes every day."
let problem3 = "My server is down."
let problem4 = "I've deleted the internet."

do {
    try contactSupport(withProblem: problem4)
} catch(let error) {
    print(error)
}

// Just using "try" could resolve in an error either use "try?" -> nil or do/catch block.
// try contactSupport(withProblem: problem4)
