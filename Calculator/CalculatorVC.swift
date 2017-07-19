import UIKit

class CalculatorVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupUI()
    }
    
    var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
    
    var displayValue: Double {
        
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    func performOperation(sender: UIButton) {
        
        userIsInTheMiddleOfTyping = false
        if let mathmaticalSymbol = sender.currentTitle {
            
            switch mathmaticalSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break
            }
            
        }
        
    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor.gray
        title = "Calculator"
    
    }
    
}
