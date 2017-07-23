
import Foundation

struct CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double)->(Double))
        case binaryOperation((Double, Double) -> Double)
        case equal
        case clear
    }
    
    private var operations: [String: Operation] = [
        
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation({ sqrt($0) }),
        "+": Operation.binaryOperation({ $0 + $1 }),
        "×": Operation.binaryOperation({ $0 * $1 }),
        "÷": Operation.binaryOperation({ $0 / $1 }),
        "sin": Operation.unaryOperation({ sin($0) }),
        "cos": Operation.unaryOperation({ cos($0) }),
        "tan": Operation.unaryOperation({ tan($0) }),
        "x^y": Operation.binaryOperation({ pow($0, $1) }),
        "y√x": Operation.binaryOperation({ pow($0, 1/$1) }),
        "%": Operation.unaryOperation({ $0 / 100 }),
        "=": Operation.equal,
        "CLEAR": Operation.clear
    ]
    
    mutating func performOperation(_ symbol: String) {
        
        if let operation = operations[symbol] {
            
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    pendingBinaryOperationStruct = PendingBinaryOperationStruct(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equal:
                performPendingBinaryOperationWhenEqualPressed()
            case .clear:
                clear()
            }
            
        }
        
    }
    
    private mutating func clear() {
        accumulator = nil
        pendingBinaryOperationStruct = nil
    }
    
    private var pendingBinaryOperationStruct: PendingBinaryOperationStruct?
    
    private mutating func performPendingBinaryOperationWhenEqualPressed() {
        
        if pendingBinaryOperationStruct != nil && accumulator != nil {
            accumulator = pendingBinaryOperationStruct!.perform(with: accumulator!)
            pendingBinaryOperationStruct = nil
        }
    }
    
    private struct PendingBinaryOperationStruct {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? {
        get {
            return accumulator
        }
    }
}
