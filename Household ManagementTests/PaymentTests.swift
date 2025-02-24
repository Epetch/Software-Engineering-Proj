import Testing
@testable import Household_Management

struct Household_ManagementTests {
    // Test Users
    private let receiver = User(
        name: "Receiver",
        house: "Test House",
        email: "receiver@test.com"
    )
    private let userA = User(
        name: "A",
        house: "Test House",
        email: "a@test.com"
    )
    private let userB = User(
        name: "B",
        house: "Test House",
        email: "b@test.com"
    )
    private let userC = User(
        name: "C",
        house: "Test House",
        email: "c@test.com"
    )
    private let outsider = User(
        name: "Outsider",
        house: "Other House",
        email: "outsider@test.com"
    )

    // Core Functionality Tests
    @Test func testSplitBillEqually() {
        let payment = makeTestPayment(total: 100.0)
        let users = [userA, userB, userC]
        
        payment.splitBillEqually(among: users)
        
        for user in users {
            #expect(payment.amountOwed(by: user) == 100.0 / 3.0)
            #expect(payment.originalSplits[user] == 100.0 / 3.0)
            #expect(payment.amountPaid(by: user) == 0.0)
        }
    }

    @Test func testPaymentTracking() {
        let payment = makeTestPayment(total: 150.0)
        payment.splitBillEqually(among: [userA, userB])
        
        payment.payShare(for: userA, amount: 75.0)
        #expect(payment.amountOwed(by: userA) == 0.0)
        #expect(payment.amountPaid(by: userA) == 75.0)
        #expect(payment.isPaid(user: userA) == true)
        
        payment.payShare(for: userB, amount: 50.0)
        #expect(payment.amountOwed(by: userB) == 25.0)
        #expect(payment.isPaid() == false)
    }

    // Edge Cases
    @Test func testOverpaymentHandling() {
        let payment = makeTestPayment(total: 200.0)
        payment.splitBillEqually(among: [userA])
        
        payment.payShare(for: userA, amount: 250.0)
        #expect(payment.amountOwed(by: userA) == 0.0)
        #expect(payment.amountPaid(by: userA) == 250.0)
        #expect(payment.isPaid() == true)
    }

    @Test func testInvalidUserPayment() {
        let payment = makeTestPayment(total: 100.0)
        payment.splitBillEqually(among: [userA])
        
        let initialOwed = payment.amountOwed(by: userA)
        payment.payShare(for: outsider, amount: 50.0)
        
        #expect(payment.amountOwed(by: outsider) == 0.0)
        #expect(payment.amountPaid(by: outsider) == 0.0)
        #expect(payment.amountOwed(by: userA) == initialOwed)
    }

    // State Validation
    @Test func testInitialState() {
        let payment = makeTestPayment(total: 100.0)
        #expect(payment.hasPaid == false)
        #expect(payment.splittedPayers.isEmpty)
        #expect(payment.originalSplits.isEmpty)
        #expect(payment.amountPaidByUser.isEmpty)
    }

    @Test func testFullPaymentCompletion() {
        let payment = makeTestPayment(total: 300.0)
        payment.splitBillEqually(among: [userA, userB, userC])
        
        [userA, userB, userC].forEach {
            payment.payShare(for: $0, amount: 100.0)
        }
        
        #expect(payment.isPaid() == true)
        #expect(payment.splittedPayers.values.allSatisfy { $0 == 0.0 })
    }

    //  Helper Methods
    private func makeTestPayment(total: Double) -> Payment {
        Payment(
            dueDate: "2023-10-10",
            description: "Test Payment",
            receiver: receiver,
            totalAmount: total
        )
    }
}