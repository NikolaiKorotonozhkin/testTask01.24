//
//  FirstLoginVC.swift
//  testTask01.24
//
//  Created by Nikolai  on 18.01.2024.
//

import UIKit
import SnapKit


class FirstLoginVC: UIViewController {
    
    let backgroundImageView = UIImageView()
    let logoImageView = UIImageView()
    let imageView = UIImageView()
    let welcomeLabel = UILabel()
    let goodLuckLabel = UILabel()
    let buttonView = UIImageView()
    let startButtonLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        setupUI()
    }
    
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "background-1")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.isUserInteractionEnabled = true
        view.addSubview(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.image = UIImage(named: "LogoSweetBananza")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(110)
            make.centerX.equalToSuperview()
//            make.leading.equalToSuperview().inset(24)
//            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(163)
        }
        
        imageView.image = UIImage(named: "image1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(282)
            make.centerX.equalToSuperview()
//            make.leading.equalToSuperview().inset(93)
//            make.trailing.equalToSuperview().inset(93)
            make.height.equalTo(206.16)
            make.width.equalTo(189.39)
//            make.bottom.equalToSuperview().inset(323)
        }
        
        welcomeLabel.text = "Welcome to the"
        welcomeLabel.font = UIFont(name: "DingExtra-Heavy", size: 27)
        welcomeLabel.textAlignment = .center
        welcomeLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        welcomeLabel.addTextOutline(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1), outlineWidth: 4)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(65)
        }
        
        goodLuckLabel.text = "Here you can play for real money and have a chance to win big. Have fun and good luck!"
        goodLuckLabel.font = UIFont(name: "DingExtra-Heavy", size: 17)
        goodLuckLabel.textAlignment = .center
        goodLuckLabel.numberOfLines = 3
        goodLuckLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
//        goodLuckLabel.addTextOutline2(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1), outlineWidth: 4)
        
        goodLuckLabel.addTextOutline2(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1),
                                      outlineWidth: 4,
                                      width: 313,
                                      height: 69)
        
        goodLuckLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(goodLuckLabel)
        goodLuckLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(519)
            make.height.equalTo(69)
            make.width.equalTo(313)
        }
        
        buttonView.image = UIImage(named: "buttonBlue")
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(buttonView)
        
        buttonView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(86)
            make.height.equalTo(82)
            make.width.equalTo(239)
        }
        
        var tapGesture = UITapGestureRecognizer()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.buttonPressed))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        buttonView.addGestureRecognizer(tapGesture)
        buttonView.isUserInteractionEnabled = true
        
        
        startButtonLabel.text = "Start"
        startButtonLabel.font = UIFont(name: "DingExtra-Heavy", size: 27)
        startButtonLabel.textAlignment = .center
        startButtonLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        startButtonLabel.addTextOutline(usingColor: UIColor(red: 0/255, green: 40/255, blue: 85/255, alpha: 1), outlineWidth: 6)
        
        startButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonView.addSubview(startButtonLabel)
        startButtonLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc func buttonPressed() {
        showNextVC()
    }
    
    private func showNextVC() {
        let vc = Onboarding1VC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
    
}



