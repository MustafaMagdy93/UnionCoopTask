//

import Foundation
import UIKit
//import DropDown


extension UITextField {
    
    func localizedTF(_ directionTF: UITextField){
        switch LocalizationManager.shared.getLanguage() {
        case .English:
            directionTF.textAlignment = .left
        case .Arabic:
            directionTF.textAlignment = .right
        case .none:
            directionTF.textAlignment = .left
        }
    }
    
    func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 1/3, green: 1/3, blue: 1/3, alpha: 1.0).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
}

extension String {
    
    var isValidEmail: Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }
    var isValidPhone: Bool {
        let regularExpressionForPhone = "^\\d{3}\\d{3}\\d{4}$"
        let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
        return testPhone.evaluate(with: self)
    }
    var isValidPassword: Bool {
        let regularExpressionForPassword = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let testPassword = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPassword)
        return testPassword.evaluate(with: self)
    }
    
    func expDateValidation(dateStr:String) {
        
        let currentYear = Calendar.current.component(.year, from: Date()) % 100   // This will give you current year (i.e. if 2019 then it will be 19)
        let currentMonth = Calendar.current.component(.month, from: Date()) // This will give you current month (i.e if June then it will be 6)
        
        let enteredYear = Int(dateStr.suffix(2)) ?? 0 // get last two digit from entered string as year
        let enteredMonth = Int(dateStr.prefix(2)) ?? 0 // get first two digit from entered string as month
        print(dateStr) // This is MM/YY Entered by user
        
        if enteredYear > currentYear {
            if (1 ... 12).contains(enteredMonth) {
                print("Entered Date Is Right")
            } else {
                print("Entered Date Is Wrong")
            }
        } else if currentYear == enteredYear {
            if enteredMonth >= currentMonth {
                if (1 ... 12).contains(enteredMonth) {
                    print("Entered Date Is Right")
                } else {
                    print("Entered Date Is Wrong")
                }
            } else {
                print("Entered Date Is Wrong")
            }
        } else {
            print("Entered Date Is Wrong")
        }
        
    }
    
}
extension UILabel {
    
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }
    }
}

extension UINavigationController {
    
    func localizedNV(_ directionNV: UINavigationController) {
        switch LocalizationManager.shared.getLanguage() {
        case .English:
            directionNV.view.semanticContentAttribute = .forceLeftToRight
        case .Arabic:
            directionNV.view.semanticContentAttribute = .forceRightToLeft
        default:
            directionNV.view.semanticContentAttribute = .forceLeftToRight
        }
    }
    
}

extension UIView {
    
    func constrainToEdges(_ subview: UIView) {
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        let topContraint = NSLayoutConstraint(
            item: subview,
            attribute: .top,
            relatedBy: .equal,
            toItem: self,
            attribute: .top,
            multiplier: 1.0,
            constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(
            item: subview,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: self,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0)
        
        let leadingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .leading,
            relatedBy: .equal,
            toItem: self,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0)
        
        let trailingContraint = NSLayoutConstraint(
            item: subview,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: self,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0)
        
        addConstraints([
                        topContraint,
                        bottomConstraint,
                        leadingContraint,
                        trailingContraint])
    }
    
    func roundTop() {
        let maskPath1 = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.topLeft , .topRight], cornerRadii: CGSize(width: 30, height: 30))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    func roundBottom() {
        let maskPath1 = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 30, height: 30))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
    
    func roundleft() {
        let maskPath1 = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft , .topLeft], cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }

    
}

//extension DropDown {
//
//    func localizedDD() {
//
//        customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
//            // Setup your custom UI components
//            switch LocalizationManager.shared.getLanguage() {
//            case .Arabic:
//                cell.optionLabel.textAlignment = .right
//            default:
//                cell.optionLabel.textAlignment = .left
//            }
//        }
//    }
//
//    func DropDownEdited(StackView : UIView) {
//        self.backgroundColor = .white
//        self.textColor = .black
//        self.shadowColor = .lightGray
//        self.layer.shadowOpacity = 0.3
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.cornerRadius = 10
//        self.isOpaque = true
//        self.clearsContextBeforeDrawing = true
//        self.clipsToBounds = false
//        self.autoresizesSubviews = true
//        self.anchorView = StackView
//        self.width = StackView.frame.width
//        self.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
//            // Setup your custom UI components
//            switch LocalizationManager.shared.getLanguage() {
//        case .Arabic:
//                cell.optionLabel.textAlignment = .right
//        default:
//                cell.optionLabel.textAlignment = .left
//            }
//
//        }
//        self.show()
//    }
//
//    func DropDownEdited2(view: UIView, view2: UIView) {
//        self.backgroundColor = .white
//        self.textFont = UIFont(name: "Avenir Roman",size: 16)!
//        self.textColor = #colorLiteral(red: 0.09411764706, green: 0.1176470588, blue: 0.3176470588, alpha: 1)
//        self.direction = .bottom
//        self.shadowColor = .lightGray
//        self.width = 100
//        self.bottomOffset = CGPoint(x: 0, y:(self.anchorView?.plainView.bounds.height) ?? 25)
//        self.layer.shadowOpacity = 0.3
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.cornerRadius = 10
//        self.isOpaque = true
//        self.clearsContextBeforeDrawing = true
//        self.clipsToBounds = false
//        self.autoresizesSubviews = true
//        self.customCellConfiguration = { (index: Index, item: String, cell: DropDownCell) -> Void in
//            // Setup your custom UI components
//            switch LocalizationManager.shared.getLanguage() {
//        case .Arabic:
//                cell.optionLabel.textAlignment = .right
//                self.anchorView = view2
//
//        default:
//                cell.optionLabel.textAlignment = .left
//                self.anchorView = view
//
//            }
//        }
//        self.show()
//    }
//
//}

extension UISearchBar {
    
     func setTextColor(color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
    
}


extension UICollectionViewFlowLayout {

    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return true
    }
}



