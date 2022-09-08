//
//  File.swift
//  
//
//  Created by Sergiy Shevchuk on 27.08.2022.
//

import UIKit

public enum SocialButtonViewType {
    case google
    case facebook
    case twitter
    case linkedin
    case apple
    
    var backgroundColor: UIColor {
        switch self {
        case .google: return UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        case .facebook: return UIColor(red: 66/255, green: 103/255, blue: 178/255, alpha: 1)
        case .twitter: return UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        case .linkedin: return UIColor(red: 40/255, green: 103/255, blue: 178/255, alpha: 1)
        case .apple: return .black
        }
    }
    
    var textColor: UIColor {
        switch self {
        case .google: return UIColor(red: 3/255, green: 3/255, blue: 3/255, alpha: 0.54)
        case .facebook,
             .twitter,
             .linkedin,
             .apple:
            return .white
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .google: return nil
        case .facebook: return nil
        case .twitter: return nil
        case .linkedin: return nil
        case .apple: return nil
        }
    }
    
    var loginText: String {
        switch self {
        case .google: return "Continue with Google"
        case .facebook: return "Continue with Facebook"
        case .twitter: return "Continue with Twitter"
        case .linkedin: return "Continue with Linkedin"
        case .apple: return "Continue with Apple"
        }
    }
    
    var registerText: String {
        switch self {
        case .google: return "Register with Google"
        case .facebook: return "Register with Facebook"
        case .twitter: return "Register with Twitter"
        case .linkedin: return "Register with Linkedin"
        case .apple: return "Register with Apple"
        }
    }
    
    var outlineColor: UIColor {
        switch self {
        case .google: return UIColor.red
        default: return UIColor.green
        }
    }
}

@IBDesignable
public class SocialButtonView: UIView {
    private var contentView: UIView?
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet var button: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public func configureForLogin(with type: SocialButtonViewType) {
        backgroundColor = type.backgroundColor
        button.setTitleColor(type.textColor, for: .normal)
        button.setTitle(type.loginText, for: .normal)
        
        layer.borderWidth = 1
        layer.borderColor = type.outlineColor.cgColor
        layer.cornerRadius = frame.height / 2
        
        imageView.image = type.icon
    }
    
    public func configureForRegistration(with type: SocialButtonViewType) {
        backgroundColor = type.backgroundColor
        button.setTitleColor(type.textColor, for: .normal)
        button.setTitle(type.registerText, for: .normal)

        layer.borderWidth = 1
        layer.borderColor = type.outlineColor.cgColor
        layer.cornerRadius = frame.height / 2
        
        imageView.image = type.icon
    }
}

private extension SocialButtonView {
    func configure() {
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        
        configure()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle.module
        let nib = UINib(nibName: "SocialButtonView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
