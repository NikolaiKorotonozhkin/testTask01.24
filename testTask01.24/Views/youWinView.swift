//
//  youWinView.swift
//  testTask01.24
//
//  Created by Nikolai  on 19.01.2024.
//

import UIKit
import SnapKit

//Банер, когда выпадает JackPot

class youWinView: UIView {
    
    let cardView = UIImageView()
    let getPrizeView = UIImageView()
    let getPrizeButtonLabel = UILabel()
    let moneyLabel = UILabel()
    let closeButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        isUserInteractionEnabled = true
        
        cardView.image = UIImage(named: "card2x")
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.isUserInteractionEnabled = true
        addSubview(cardView)
        
        cardView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(262)
            make.width.equalTo(343)
            make.height.equalTo(401)
        }
        
        moneyLabel.text = "$10 000"
        moneyLabel.font = UIFont(name: "DingExtra-Heavy", size: 48)
        moneyLabel.textAlignment = .center
        moneyLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        moneyLabel.addTextOutline2(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1),
                                   outlineWidth: 8,
                                   width: 198 + 8,
                                   height: 62)
        
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(moneyLabel)
        moneyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(234)
            make.height.equalTo(62)
            make.width.equalTo(198 + 8)
        }
        
        getPrizeView.image = UIImage(named: "snipButton")
        getPrizeView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(getPrizeView)
        
        getPrizeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(155)
            make.height.equalTo(82)
            make.width.equalTo(239)
        }
        
        getPrizeButtonLabel.text = "GET PRIZE"
        getPrizeButtonLabel.font = UIFont(name: "DingExtra-Heavy", size: 27)
        getPrizeButtonLabel.textAlignment = .center
        getPrizeButtonLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        getPrizeButtonLabel.addTextOutline(usingColor: UIColor(red: 0/255, green: 40/255, blue: 85/255, alpha: 1), outlineWidth: 6)
        
        getPrizeButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        getPrizeView.addSubview(getPrizeButtonLabel)
        getPrizeButtonLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        var tapGesture = UITapGestureRecognizer()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.buttonPressed))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        getPrizeView.addGestureRecognizer(tapGesture)
        getPrizeView.isUserInteractionEnabled = true
        
        closeButton.setTitle("X", for: .normal)
        closeButton.backgroundColor = .clear
        closeButton.titleLabel?.font = .systemFont(ofSize: 20)
        closeButton.addTarget(self, action: #selector(closeButtonPressed), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(closeButton)
        
        closeButton.snp.makeConstraints { make in
            make.bottom.equalTo(cardView.snp.top).inset(-59)
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
        print("get prize")
        isHidden = true
    }
}

