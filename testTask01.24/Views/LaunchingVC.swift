//
//  SecondVC.swift
//  testTask01.24
//
//  Created by Nikolai  on 13.01.2024.
//

import UIKit
import SnapKit

class LaunchingVC: UIViewController {
    
    let backgroundImageView = UIImageView()
    let logoImageView = UIImageView()
    var progressBar = UIProgressView()
    let progressLabel = UILabel()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        
        setupUI()
    }
    
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "background-1")
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        logoImageView.image = UIImage(named: "LogoSweetBananza")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(logoImageView)
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(124)
            make.centerX.equalToSuperview()
//            make.leading.equalToSuperview().inset(24)
//            make.trailing.equalToSuperview().inset(24)
            make.height.equalTo(163)
            make.width.equalTo(327)
        }
                
        let gradientImage = UIImage.gradientImage(with: CGRect(x: 0, y: 0, width: 284, height: 43),
                                                  colors: [UIColor(red: 201/255, green: 0/255, blue: 137/255, alpha: 1).cgColor,
                                                           UIColor(red: 231/255, green: 33/255, blue: 190/255, alpha: 1).cgColor,
                                                           UIColor(red: 247/255, green: 52/255, blue: 220/255, alpha: 1).cgColor,
                                                           UIColor(red: 249/255, green: 56/255, blue: 230/255, alpha: 1).cgColor,
                                                           UIColor(red: 253/255, green: 63/255, blue: 248/255, alpha: 1).cgColor,
                                                           UIColor(red: 255/255, green: 66/255, blue: 255/255, alpha: 1).cgColor],
                                                locations: nil)
        
        progressBar.progress = 0
        progressBar.progressViewStyle = .default
        //Устанавливаем градиен для линии прогресса
        progressBar.progressImage = gradientImage!
        progressBar.backgroundColor = UIColor(red: 116/255, green: 27/255, blue: 121/255, alpha: 1)
        progressBar.center = view.center
        progressBar.layer.cornerRadius = 21.5
        progressBar.clipsToBounds = true
        
        //Закругления для линии прогресса
        progressBar.layer.sublayers![1].cornerRadius = 21.5
        progressBar.subviews[1].clipsToBounds = true
        
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressBar)
        
        progressBar.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(408)
            make.leading.equalToSuperview().inset(45)
            make.trailing.equalToSuperview().inset(45)
            make.height.equalTo(43)
        }
        
        
        progressLabel.text = "0%"
        progressLabel.font = UIFont(name: "DingExtra-Heavy", size: 20)
        progressLabel.textAlignment = .center
        progressLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        progressLabel.addTextOutline(usingColor: UIColor(red: 69/255, green: 10/255, blue: 73/255, alpha: 1), outlineWidth: 6)
        
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressBar.addSubview(progressLabel)
        progressLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(progressUpdate), userInfo: nil, repeats: true)
    }
    
    @objc func progressUpdate() {
        progressLabel.subviews.forEach({$0.removeFromSuperview()})
        
        progressBar.progress = progressBar.progress + 0.05
        progressLabel.text = String(Int(progressBar.progress * 100)) + "%"

        progressLabel.addTextOutline(usingColor: UIColor(red: 69/255, green: 10/255, blue: 73/255, alpha: 1), outlineWidth: 6)
        
        if progressBar.progress == 1 {
            timer.invalidate()
            print("END")
            showNextVC()
        }
    }
    
    private func showNextVC() {
        let vc = FirstLoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}




