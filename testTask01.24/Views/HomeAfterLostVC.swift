//
//  Onboarding2VC.swift
//  testTask01.24
//
//  Created by Nikolai  on 18.01.2024.
//

import UIKit
import SnapKit

//Проиграл в прошлый раз
class Onboarding2VC: UIViewController {
    
    let backgroundImageView = UIImageView()
    let logoImageView = UIImageView()
    let topLabel = UILabel()
    let imageView = UIImageView()
    let bottomLabel = UILabel()
    let buttonView = UIImageView()
    let spinButtonLabel = UILabel()
    
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
        
        topLabel.text = "Today you will \n definitely get lucky"
        topLabel.font = UIFont(name: "DingExtra-Heavy", size: 27)
        topLabel.textAlignment = .center
        topLabel.numberOfLines = 2
        topLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        topLabel.addTextOutline2(usingColor: UIColor(red: 49/255, green: 21/255, blue: 102/255, alpha: 1),
                                 outlineWidth: 4,
                                 width: 326,
                                 height: 70)
        
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(topLabel)
        topLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(593)
//            make.top.equalToSuperview().inset(149)
            make.height.equalTo(70)
            make.width.equalTo(326)
        }
        
        imageView.image = UIImage(named: "image3")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(237)
            make.bottom.equalToSuperview().inset(296)
            make.centerX.equalToSuperview()
            make.height.equalTo(279)
            make.width.equalTo(358)
        }
        
        bottomLabel.text = "Today the number of jackpots is \n \(Int.random(in: 5...30))% higher than yesterday"
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
            make.bottom.equalToSuperview().inset(230)
//            make.top.equalToSuperview().inset(538)
            make.height.equalTo(44)
            make.width.equalTo(313)
        }
        
        buttonView.image = UIImage(named: "snipButton")
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
        
        spinButtonLabel.text = "Spin"
        spinButtonLabel.font = UIFont(name: "DingExtra-Heavy", size: 27)
        spinButtonLabel.textAlignment = .center
        spinButtonLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        spinButtonLabel.addTextOutline(usingColor: UIColor(red: 0/255, green: 40/255, blue: 85/255, alpha: 1), outlineWidth: 6)
        
        spinButtonLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonView.addSubview(spinButtonLabel)
        spinButtonLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    @objc func buttonPressed() {
        showNextVC()
    }
    
    private func showNextVC() {
        let vc = GameVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
