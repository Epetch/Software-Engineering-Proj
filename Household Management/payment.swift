import Foundation

class Payment {
    
    // MARK: - Properties
    var dueDate: String
    var description: String
    var receiver: User
    var hasPaid: Bool
    var payer: User?
    var totalAmount: Double
    var splittedPayers: [User: Double]
    var originalSplits: [User: Double]
    var amountPaidByUser: [User: Double]
    
    // - Initializer
    init(dueDate: String,
         description: String,
         receiver: User,
         totalAmount: Double,
         payer: User? = nil,
         hasPaid: Bool = false) {
        
        self.dueDate = dueDate
        self.description = description
        self.receiver = receiver
        self.totalAmount = totalAmount
        self.payer = payer
        self.hasPaid = hasPaid
        
        self.splittedPayers = [:]
        self.originalSplits = [:]
        self.amountPaidByUser = [:]
    }
    
    // - Bill Splitting
    func splitBillEqually(among users: [User]) {
        guard !users.isEmpty else { return }
        
        let eachShare = totalAmount / Double(users.count)
        for user in users {
            splittedPayers[user] = eachShare
            originalSplits[user] = eachShare
            amountPaidByUser[user] = 0.0
        }
    }
    
    // MARK: - Payment Functions
    func payShare(for user: User, amount: Double) {
        guard let currentOwed = splittedPayers[user],
              let currentPaid = amountPaidByUser[user] else {
            print("User not found in the payment split.")
            return
        }
        
        let newPaid = currentPaid + amount
        amountPaidByUser[user] = newPaid
        
        let originalShare = originalSplits[user] ?? 0.0
        let newOwed = max(originalShare - newPaid, 0.0)
        splittedPayers[user] = newOwed
        
        let allPaid = splittedPayers.values.allSatisfy { $0 == 0.0 }
        if allPaid {
            hasPaid = true
        }
    }
    
    // - Query Functions
    func amountPaid(by user: User) -> Double {
        return amountPaidByUser[user] ?? 0.0
    }
    
    func amountOwed(by user: User) -> Double {
        return splittedPayers[user] ?? 0.0
    }
    
    func isPaid(user: User) -> Bool {
        return amountOwed(by: user) == 0.0
    }
    
    func isPaid() -> Bool {
        return hasPaid
    }
    
    // - Reminders
    func sendReminders() {
        for (user, amountOwed) in splittedPayers where amountOwed > 0 {
            print("Reminder to \(user.name): You owe \(amountOwed) for \(description).")
        }
    }
}
