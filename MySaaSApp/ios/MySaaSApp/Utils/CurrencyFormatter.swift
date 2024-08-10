import Foundation

struct CurrencyFormatter {
    static let shared = CurrencyFormatter()
    
    private let numberFormatter: NumberFormatter
    
    private init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
    }
    
    func string(from value: Double) -> String {
        return numberFormatter.string(from: NSNumber(value: value)) ?? "$0.00"
    }
    
    func double(from string: String) -> Double? {
        return numberFormatter.number(from: string)?.doubleValue
    }
}
