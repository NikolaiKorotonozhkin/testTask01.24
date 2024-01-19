//
//  GameVC.swift
//  testTask01.24
//
//  Created by Nikolai  on 18.01.2024.
//

import UIKit

class GameVC: UIViewController {
    
    let backgroundImageView = UIImageView()
    let logoImageView = UIImageView()
    let coinsView = UIImageView()
    let buttonView = UIImageView()
    let spinButtonLabel = UILabel()
    let slotView = UIImageView()
    
    let betBackgroundView = UIView()
    let bankBackgroundView = UIView()
    let smallCoinsView = UIImageView()
    let bankLabel = UILabel()
    let betLabel = UILabel()
    
    let minusButton = UIButton()
    let plusButton = UIButton()
    
    var totalBank = 500
    var bet = 10
    
    var winView = youWinView()
    var loseView = youLostView()
    
    let imageArray = ["slotImage1",
                             "slotImage2",
                             "slotImage3",
                             "slotImage4",
                             "slotImage5",
                             "slotImage6"]
    
    var dataArray = [[Int](), [Int](), [Int]()]
    
    var slotPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSlot()
        
        slotPickerView.delegate   = self
        slotPickerView.dataSource = self
        loadData()
        spinSlots()
    }
    
    func loadData() {
        for i in 0...2 {
            for _ in 0...100 {
                dataArray[i].append(Int.random(in: 0...imageArray.count - 1))
            }
        }
    }
    
    func setupSlot() {
        slotPickerView.backgroundColor = .clear
        
        slotView.addSubview(slotPickerView)
        slotPickerView.translatesAutoresizingMaskIntoConstraints = false
        
        slotPickerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func spinSlots() {
        for i in 0...2 {
            let rInt = Int.random(in: 3...97)
            slotPickerView.selectRow(rInt, inComponent: i, animated: true)
        }
    }
    
    func checkWinOrLose() {
        let emoji0 = slotPickerView.selectedRow(inComponent: 0)
        let emoji1 = slotPickerView.selectedRow(inComponent: 1)
        let emoji2 = slotPickerView.selectedRow(inComponent: 2)

        if (dataArray[0][emoji0] == dataArray[1][emoji1]
         && dataArray[1][emoji1] == dataArray[2][emoji2]) {
            winView.isHidden = false
            totalBank = totalBank + 10000
            bankLabel.text = "$\(totalBank)"
        } else {
            totalBank = totalBank - bet
            bankLabel.text = "$\(totalBank)"
            if totalBank <= 0 {
                loseView.isHidden = false
                totalBank = 300
                bankLabel.text = "$\(totalBank)"
            }
        }
        
        buttonView.isUserInteractionEnabled = true
        buttonView.alpha = 1
    }
    
    private func setupUI() {
        backgroundImageView.image = UIImage(named: "backgroundGame")
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
//            make.top.equalToSuperview().inset(56)
            make.bottom.equalToSuperview().inset(591)
            make.centerX.equalToSuperview()
            make.height.equalTo(165)
            make.width.equalTo(335)
        }
        
        slotView.image = UIImage(named: "slotsbg2x")
        slotView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(slotView)
        
        slotView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(324)
            make.centerX.equalToSuperview()
            make.height.equalTo(242)
            make.width.equalTo(335)
        }
        
        coinsView.image = UIImage(named: "coins1x")
        coinsView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(coinsView)
        
        coinsView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        betBackgroundView.backgroundColor = UIColor(red: 0.408, green: 0.09, blue: 0.176, alpha: 1)
        betBackgroundView.layer.cornerRadius = 20.82
        betBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(betBackgroundView)
        
        betBackgroundView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(104)
            make.trailing.equalToSuperview().inset(34)
            make.height.equalTo(42)
            make.width.equalTo(146)
        }
        
        bankBackgroundView.backgroundColor = UIColor(red: 0.408, green: 0.09, blue: 0.176, alpha: 1)
        bankBackgroundView.layer.cornerRadius = 20.82
        bankBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(bankBackgroundView)

        bankBackgroundView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(104)
            make.leading.equalToSuperview().inset(34)
            make.height.equalTo(42)
            make.width.equalTo(146)
        }
        
        smallCoinsView.image = UIImage(named: "3coins2x")
        smallCoinsView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(smallCoinsView)
        
        smallCoinsView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(26)
            make.bottom.equalToSuperview().inset(103)
            make.height.equalTo(61.11)
            make.width.equalTo(41.08)
        }
        
        minusButton.backgroundColor = UIColor(red: 92/255, green: 19/255, blue: 39/255, alpha: 1)
        minusButton.setTitle("-", for: .normal)
        minusButton.titleLabel?.font = .systemFont(ofSize: 28)
        minusButton.layer.cornerRadius = 21
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        betBackgroundView.addSubview(minusButton)
        minusButton.addTarget(self, action: #selector(minusButtonPressed), for: .touchUpInside)
        
        minusButton.snp.makeConstraints { make in
            make.height.equalTo(42)
            make.width.equalTo(42)
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        plusButton.backgroundColor = UIColor(red: 92/255, green: 19/255, blue: 39/255, alpha: 1)
        plusButton.setTitle("+", for: .normal)
        plusButton.titleLabel?.font = .systemFont(ofSize: 28)
        plusButton.layer.cornerRadius = 21
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        betBackgroundView.addSubview(plusButton)
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        
        plusButton.snp.makeConstraints { make in
            make.height.equalTo(42)
            make.width.equalTo(42)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        bankLabel.text = "$\(totalBank)"
        bankLabel.font = UIFont(name: "DingExtra-Heavy", size: 20)
        bankLabel.textAlignment = .center
        bankLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        bankLabel.translatesAutoresizingMaskIntoConstraints = false
        bankBackgroundView.addSubview(bankLabel)
        bankLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        betLabel.text = "$\(bet)"
        betLabel.font = UIFont(name: "DingExtra-Heavy", size: 20)
        betLabel.textAlignment = .center
        betLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        betLabel.translatesAutoresizingMaskIntoConstraints = false
        betBackgroundView.addSubview(betLabel)
        betLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        
        buttonView.image = UIImage(named: "snipButton")
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.addSubview(buttonView)
        
        buttonView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(211)
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
        
        winView = youWinView(frame: view.frame)
        view.addSubview(winView)
        winView.isHidden = true
        
        loseView = youLostView(frame: view.frame)
        view.addSubview(loseView)
        loseView.isHidden = true
        
    }
    
    @objc func buttonPressed() {
        if bet <= totalBank {
            buttonView.isUserInteractionEnabled = false
            buttonView.alpha = 0.9
            DispatchQueue.main.async {
                self.spinSlots()
                DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.8) {
                    self.checkWinOrLose()
                }
            }
        }
    }
    
    @objc func minusButtonPressed() {
        if bet > 10 {
            bet = bet - 10
            betLabel.text = "$\(bet)"
        }
    }
    
    @objc func plusButtonPressed() {
        bet = bet + 10
        betLabel.text = "$\(bet)"
    }
    
}


// MARK:UIPickerViewDataSource
extension GameVC : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
}

// MARK:UIPickerViewDelegate
extension GameVC: UIPickerViewDataSource {
    
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 300 / 3
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 218 / 3
    }
    
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let localView = UIView()
        localView.backgroundColor = .yellow

        let imageView = UIImageView()

        switch component {
        case 0 : imageView.image = UIImage(named: imageArray[(Int)(dataArray[0][row])])
        case 1 : imageView.image = UIImage(named: imageArray[(Int)(dataArray[1][row])])
        case 2 : imageView.image = UIImage(named: imageArray[(Int)(dataArray[2][row])])
        default : print("done")
        }

        imageView.frame = CGRect(x: 0, y: 0, width: 56, height: 56)
        imageView.backgroundColor = .clear

        localView.addSubview(imageView)
        localView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }
}


