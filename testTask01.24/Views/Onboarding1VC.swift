//
//  Onboarding1VC.swift
//  testTask01.24
//
//  Created by Nikolai  on 18.01.2024.
//

import UIKit
import SnapKit

class Onboarding1VC: UIViewController {
    
    let backgroundImageView = UIImageView()
    let logoImageView = UIImageView()
    let topLabel = UILabel()
    let moneyLabel = UILabel()
    let imageView = UIImageView()
    let bottomLabel = UILabel()
    let buttonView = UIImageView()
    let startButtonLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
//            make.top.equalToSuperview().inset(45)
            make.bottom.equalToSuperview().inset(690)
            make.centerX.equalToSuperview()
            make.height.equalTo(77)
            make.width.equalTo(156)
        }
        
        topLabel.text = "Congratulations! \n Last time you won"
        topLabel.font = UIFont(name: "DingExtra-Heavy", size: 27)
        topLabel.textAlignment = .center
        topLabel.numberOfLines = 2
        topLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        topLabel.addTextOutline2(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1),
                                 outlineWidth: 4,
                                 width: 299,
                                 height: 70)
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(593)
//            make.top.equalToSuperview().inset(149)
            make.height.equalTo(70)
            make.width.equalTo(299)
        }
        
        moneyLabel.text = "$500"
        moneyLabel.font = UIFont(name: "DingExtra-Heavy", size: 40)
        moneyLabel.textAlignment = .center
        moneyLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
//        moneyLabel.addTextOutline(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1), outlineWidth: 8)
        
        moneyLabel.addTextOutline2(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1),
                                 outlineWidth: 8,
                                 width: 106 + 8,
                                 height: 52)
        
        moneyLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(moneyLabel)
        moneyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(525)
//            make.top.equalToSuperview().inset(235)
            make.height.equalTo(52)
            make.width.equalTo(106)
        }
        
        imageView.image = UIImage(named: "image2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(278)
            make.bottom.equalToSuperview().inset(284)
            make.centerX.equalToSuperview()
            make.height.equalTo(250)
            make.width.equalTo(378)
        }
        
        bottomLabel.text = "Try your luck again \n and increase your profit"
        bottomLabel.font = UIFont(name: "DingExtra-Heavy", size: 17)
        bottomLabel.textAlignment = .center
        bottomLabel.numberOfLines = 2
        bottomLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        bottomLabel.addTextOutline2(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1),
                                 outlineWidth: 4,
                                 width: 313,
                                 height: 44)
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(bottomLabel)
        bottomLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(233)
//            make.top.equalToSuperview().inset(535)
            make.height.equalTo(44)
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
        let vc = Onboarding2VC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
