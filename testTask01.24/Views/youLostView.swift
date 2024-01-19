//
//  youLOstView.swift
//  testTask01.24
//
//  Created by Nikolai  on 19.01.2024.
//

import UIKit
import SnapKit

//Банер, когда баланс закончился

class youLostView: UIView {
    
    let cardView = UIImageView()
    let lostLabel = UILabel()
    let tryAgainView = UIImageView()
    let tryAgainButtonLabel = UILabel()
    let closeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        isUserInteractionEnabled = true
        
        cardView.image = UIImage(named: "cardLost")
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.isUserInteractionEnabled = true
        addSubview(cardView)
        
        cardView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(410)
            make.width.equalTo(343)
            make.height.equalTo(188)
        }
        
        lostLabel.text = "Oops, you lost..."
        lostLabel.font = UIFont(name: "DingExtra-Heavy", size: 32)
        lostLabel.textAlignment = .center
        lostLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        lostLabel.addTextOutline2(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1),
                                   outlineWidth: 6,
                                   width: 246 + 6,
                                   height: 42)
        
        lostLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(lostLabel)
        lostLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(75)
            make.height.equalTo(42)
            make.width.equalTo(246 + 6)
        }
        
        tryAgainView.image = UIImage(named: "snipButton")
        tryAgainView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tryAgainView)
        
        tryAgainView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(155)
            make.height.equalTo(82)
            make.width.equalTo(239)
        }
        
        var tapGesture = UITapGestureRecognizer()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.buttonPressed))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        tryAgainView.addGestureRecognizer(tapGesture)
        tryAgainView.isUserInteractionEnabled = true
        
        tryAgainButtonLabel.text = "TRY AGAIN"
        tryAgainButtonLabel.font = UIFont(name: "DingExtra-Heavy", size: 27)
        tryAgainButtonLabel.textAlignment = .center
        tryAgainButtonLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        tryAgainButtonLabel.addTextOutline(usingColor: UIColor(red: 0/255, green: 40/255, blue: 85/255, alpha: 1), outlineWidth: 6)
        
        tryAgainButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        tryAgainView.addSubview(tryAgainButtonLabel)
        tryAgainButtonLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        closeButton.setTitle("X", for: .normal)
        closeButton.backgroundColor = .clear
        closeButton.titleLabel?.font = .systemFont(ofSize: 20)
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(closeButton)
        
        closeButton.snp.makeConstraints { make in
            make.bottom.equalTo(cardView.snp.top).inset(-124)
            make.trailing.equalTo(cardView.snp.trailing).inset(13)
            make.width.equalTo(16)
            make.height.equalTo(16)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeButtonPressed() {
        print("close")
        isHidden = true
    }
    
    @objc func buttonPressed() {
        print("try again")
        isHidden = true
        
    }
}
