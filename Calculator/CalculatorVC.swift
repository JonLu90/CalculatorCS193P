import UIKit

class CalculatorVC: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupUI()

    }
    
    private var brain = CalculatorBrain()
    
    var userIsInTheMiddleOfTyping = false
    
    var displayValue: Double {
        
        get {
            return Double(resultLabel.text!)!
        }
        set {
            resultLabel.text = String(newValue)
        }
    }
    
    func touchDigit(sender: UIButton) {
        
        // to check if "." is pressed
        if displayValue != round(displayValue) && sender.titleLabel?.text == "." {
            return
        }
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = resultLabel.text!
            resultLabel.text = textCurrentlyInDisplay + digit
        }
        else {
            resultLabel.text = digit
            userIsInTheMiddleOfTyping = true
        }
        print(resultLabel.text!)
    }
    
    func performOperation(sender: UIButton) {
        
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
        }
        
        if userIsInTheMiddleOfTyping {
            if let mathmaticalSymbol = sender.currentTitle {
                brain.performOperation(mathmaticalSymbol)
            }
        }
        if let result = brain.result {
            displayValue = result
        }
        
        userIsInTheMiddleOfTyping = false
        
        // if "CLEAR" button is pressed
        if sender.titleLabel?.text! == "CLEAR" {
            userIsInTheMiddleOfTyping = false
            resultLabel.text = "0"
            descriptionLabel.text = ""
        }
        print(resultLabel.text!)

    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor.gray
        title = "Calculator"
        navigationController?.navigationBar.barTintColor = UIColor.gray
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: deleteButton)
        view.addSubview(labelStackView)
        view.addSubview(buttonStackView)
        view.addSubview(deleteButton)
        
        stackView1.axis = .horizontal
        stackView2.axis = .horizontal
        stackView3.axis = .horizontal
        stackView4.axis = .horizontal
        stackView5.axis = .horizontal
        stackView6.axis = .horizontal
        
        stackView1.addArrangedSubview(numberButton0)
        stackView1.addArrangedSubview(numberButtonDot)
        stackView1.addArrangedSubview(numberButton1)
        stackView1.addArrangedSubview(buttonPlus)
        stackView1.spacing = 8
        stackView1.distribution = UIStackViewDistribution.fillEqually
        
        stackView2.addArrangedSubview(numberButton2)
        stackView2.addArrangedSubview(numberButton3)
        stackView2.addArrangedSubview(numberButton4)
        stackView2.addArrangedSubview(buttonMinus)
        stackView2.spacing = 8
        stackView2.distribution = UIStackViewDistribution.fillEqually
        
        stackView3.addArrangedSubview(numberButton5)
        stackView3.addArrangedSubview(numberButton6)
        stackView3.addArrangedSubview(numberButton7)
        stackView3.addArrangedSubview(buttonMultiply)
        stackView3.spacing = 8
        stackView3.distribution = UIStackViewDistribution.fillEqually
        
        stackView4.addArrangedSubview(numberButton8)
        stackView4.addArrangedSubview(numberButton9)
        stackView4.addArrangedSubview(buttonEqualSign)
        stackView4.addArrangedSubview(buttonDivide)
        stackView4.spacing = 8
        stackView4.distribution = UIStackViewDistribution.fillEqually
    
        stackView5.addArrangedSubview(buttonSin)
        stackView5.addArrangedSubview(buttonCos)
        stackView5.addArrangedSubview(buttonTan)
        stackView5.addArrangedSubview(buttonPercentage)
        stackView5.spacing = 8
        stackView5.distribution = UIStackViewDistribution.fillEqually
        
        stackView6.addArrangedSubview(buttonClear)
        stackView6.addArrangedSubview(buttonPi)
        stackView6.addArrangedSubview(buttonExponent)
        stackView6.addArrangedSubview(buttonRoot)
        stackView6.spacing = 8
        stackView6.distribution = UIStackViewDistribution.fillEqually
        
        buttonStackView.axis = .vertical
        buttonStackView.spacing = 8
        buttonStackView.addArrangedSubview(stackView6)
        buttonStackView.addArrangedSubview(stackView5)
        buttonStackView.addArrangedSubview(stackView4)
        buttonStackView.addArrangedSubview(stackView3)
        buttonStackView.addArrangedSubview(stackView2)
        buttonStackView.addArrangedSubview(stackView1)
        buttonStackView.distribution = UIStackViewDistribution.fillEqually
        
        labelStackView.axis = .vertical
        labelStackView.spacing = 4
        labelStackView.addArrangedSubview(resultLabel)
        labelStackView.addArrangedSubview(descriptionLabel)
        labelStackView.distribution = UIStackViewDistribution.fillEqually

        setupConstraints()
    }
    
    func setupConstraints() {
        
        let offsetRect = navigationController?.navigationBar.bounds
        
        labelStackView.heightAnchor.constraint(equalToConstant: 124).isActive = true
        labelStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: (offsetRect?.height)!+28).isActive = true
        labelStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 4).isActive = true
        view.rightAnchor.constraint(equalTo: labelStackView.rightAnchor, constant: 4).isActive = true
        
        buttonStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 4).isActive = true
        buttonStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 4).isActive = true
        view.rightAnchor.constraint(equalTo: buttonStackView.rightAnchor, constant: 4).isActive = true
        view.bottomAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 4).isActive = true
    }
    
    var stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    var stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    var stackView3: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    var stackView4: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    var stackView5: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    var stackView6: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()

    var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    var numberButton0: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("0", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.orange
        
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()
    
    var numberButton1: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("1", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.orange

        return button
    }()
    
    var numberButton2: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("2", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.orange

        return button
    }()
    
    var numberButton3: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("3", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.orange

        return button
    }()
    
    var numberButton4: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("4", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.orange

        return button
    }()
    
    var numberButton5: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("5", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.orange

        return button
    }()
    
    var numberButton6: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("6", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.orange

        return button
    }()
    
    var numberButton7: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("7", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.orange

        return button
    }()
    
    var numberButton8: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("8", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.orange

        return button
    }()
    
    var numberButton9: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("9", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        
        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.orange

        return button
    }()
    
    var numberButtonDot: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle(".", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.orange

        button.addTarget(self, action: #selector(touchDigit(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()
    
    var buttonEqualSign: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("=", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()
    
    var buttonPlus: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("+", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()
    
    var buttonMinus: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("-", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()

    var buttonMultiply: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("×", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()

    var buttonDivide: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("÷", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()

    var buttonSin: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("sin", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()

    var buttonCos: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("cos", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()

    var buttonTan: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("tan", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()

    var buttonPercentage: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("%", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()

    var buttonClear: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("CLEAR", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown
        
        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()

    var buttonPi: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("π", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()

    var buttonExponent: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("x^y", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown

        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()
    
    var buttonRoot: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitle("y√x", for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.brown
        
        button.addTarget(self, action: #selector(performOperation(sender:)), for: UIControlEvents.touchUpInside)
        
        return button
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.font = label.font.withSize(40)
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor

        return label
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.blue
        label.text = "0"
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.white
        label.font = label.font.withSize(40)
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        
        return label
    }()
    
    var deleteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.setTitle("Del", for: UIControlState.normal)
        
        return button
    }()
}
