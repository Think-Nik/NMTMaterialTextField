import UIKit

@IBDesignable public class NMTMaterialTextField: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lblPlaceholder: UILabel!
    @IBOutlet weak var viewForTextField: UIView!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    @IBInspectable var placeholder: String = "Enter Value" {
        didSet {
            txtField.placeholder = placeholder
            lblPlaceholder.text = placeholder
        }
    }
    @IBInspectable var borderColor: UIColor = .systemBlue {
        didSet {
            viewForTextField.layer.borderColor = borderColor.cgColor
            lblPlaceholder.textColor = borderColor
        }
    }
    @IBInspectable var error: String = "Please enter value" {
        didSet {
            lblError.text = error
        }
    }
    
    @IBInspectable var isOptional: Bool = false {
        didSet {
            isTextFieldValueOptional = isOptional
        }
    }
    
    @IBInspectable var isSecureText: Bool = false {
        didSet {
            txtField.isSecureTextEntry = isSecureText
        }
    }
    
    public var text: String = ""
    private var isTextFieldValueOptional: Bool = false
    private var isValid: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.module.loadNibNamed("NMTMaterialTextField", owner: self)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        txtField.delegate = self
        viewForTextField.layer.borderColor = borderColor.cgColor
        lblPlaceholder.textColor = borderColor
        lblError.text = error
        lblPlaceholder.text = placeholder
        txtField.placeholder = placeholder
        viewForTextField.layer.borderWidth = 1.0
        viewForTextField.layer.cornerRadius = 8
        lblPlaceholder.alpha = 0.0
    }
    
    public func showError(error: String) {
        lblError.isHidden = false
        lblError.text = error
        viewForTextField.layer.borderColor = UIColor.systemRed.cgColor
        viewForTextField.shake(horizontally: true)
        lblError.shake(horizontally: true)
        enablePlaceholder(enable: false)
    }
    
    public func validateField(with regex: String) {        
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        isTextFieldValueOptional = false
        isValid = predicate.evaluate(with: txtField.text)
    }
}

extension NMTMaterialTextField: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        enablePlaceholder(enable: true)
        viewForTextField.layer.borderColor = borderColor.cgColor
        lblError.isHidden = true
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        text = textField.text ?? ""
        if textField.text == "" && !isTextFieldValueOptional {
            showError()
        } else if !isValid {
            showError()
        }
    }
    
    private func showError() {
        lblError.isHidden = false
        viewForTextField.layer.borderColor = UIColor.systemRed.cgColor
        viewForTextField.shake(horizontally: true)
        lblError.shake(horizontally: true)
        enablePlaceholder(enable: false)
    }
    
    private func enablePlaceholder(enable: Bool) {
        txtField.placeholder = !enable ? placeholder : nil
        if txtField.text == "" {
            lblPlaceholder.shake(horizontally: false)
        }
        lblPlaceholder.alpha = !enable ? 0.0 : 1.0
    }
}


extension UIView {
    func shake(horizontally: Bool) {
        let animation = CAKeyframeAnimation(keyPath: horizontally ? "transform.translation.x" : "transform.translation.y")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = horizontally ? [-20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ] : [6.0, -6.0, 4.0, -2.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}
