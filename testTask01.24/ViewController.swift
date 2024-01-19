////
////  ViewController.swift
////  testTask01.24
////
////  Created by Nikolai  on 13.01.2024.
////
//
//import UIKit
//import FirebaseRemoteConfig
//import WebKit
//
//class ViewController: UIViewController {
//    
//    var remoteConfig = RemoteConfig.remoteConfig()
//    var isClick = false
//    var baseURL = ""
//    var urlForWebView = ""
//    let defaults = UserDefaults.standard
//    var webView = WKWebView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .red
//        fetchTestLink()
////        setWebView()
////        defCount()
////
////        let settings = RemoteConfigSettings()
////        settings.minimumFetchInterval = 0
////        remoteConfig.configSettings = settings
////
////        print("строка перед фетч")
////        DispatchQueue.main.async {
////            self.fetchRemote()
////        }
////
////        print("строка после фетч")
//
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
////        showMainVC()
////        fetchTestLink()
//
//    }
//
//    func fetchTestLink() {
//        let urlStr = "https://api.telegra.ph/getPage/Link-01-15-20"
////        let urlStr = "https://wavokyha.com"
//
//        NetworkDataFetch.shared.fetchLink(urlString: urlStr) { ourLink, error in
//            if error == nil {
//                guard let ourLink = ourLink else { return }
//
//                print("JSON из Телеграфа = \(ourLink)")
//                self.urlForWebView = ourLink.result.description
//                print("urlForWebView = \(self.urlForWebView)")
//            } else {
//                print(error!.localizedDescription)
//            }
//        }
//    }
//
//
//    func defCount() {
//        if defaults.string(forKey: "test") == nil {
//            print("OK TEST")
//        } else {
//            print("OKOKOK test")
//            print(defaults.string(forKey: "test"))
//        }
//
//
//        if defaults.bool(forKey: "First Launch") == true {
//                    print("Second+")
//                    // Run Code After First Launch
//                    defaults.set(true, forKey: "First Launch")
//            defaults.set("YYY", forKey: "test")
//                } else {
//                    print("First")
//                    // Run Code During First Launch
//                    defaults.set(true, forKey: "First Launch")
//
//                }
//    }
//
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
////        remoteConfig.fetchAndActivate { status, error in
////            if error != nil {
////                print(error!.localizedDescription)
////            } else {
////                if status != .error {
////                    if let baseURL = self.remoteConfig["baseURL"].stringValue {
////                        print("Success: \(baseURL)")
////                    }
////                }
////
//////                if let isClick = self.remoteConfig["isClick"].stringValue {
//////                    print(isClick)
//////                }
////                let isClick = self.remoteConfig["isClick"].boolValue
////                switch isClick {
////                case true:
////                    print("success Bool True: \(isClick)")
////                case false:
////                    print("success Bool False: \(isClick)")
////                }
////
////            }
////        }
//
//    }
//
//    func fetchRemote() {
//        print("функция фетч")
//        remoteConfig.fetchAndActivate { status, error in
//            if error != nil {
//                print(error!.localizedDescription)
//            } else {
//                if status != .error {
//                    let localIsClick = self.remoteConfig["isClick"].boolValue
//                    print("is local click = \(localIsClick)")
//                    self.isClick = localIsClick
//
////                    switch localIsClick {
////                    case true:
////                        print("делаем запрос на ссылку")
////                        if let baseURL = self.remoteConfig["baseURL"].stringValue {
////                            print("Success: \(baseURL)")
////                        }
////                    case false:
////                        print("не делаем запрос")
////                        let vc = MainViewController()
//////                        vc.modalPresentationStyle = .fullScreen
////                        self.present(vc, animated: true)
////                    }
//                }
//            }
//        }
//    }
//
//    func showMainVC() {
//        print("show vc func")
//        let vc = LaunchingVC()
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
//    }
//
//    func setWebView() {
//        view.addSubview(webView)
//        webView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
//
//        reloadRequest()
//    }
//
//    func reloadRequest() {
//        guard let url = URL(string: "https://www.youtube.com") else { return }
//        let urlRequest = URLRequest(url: url)
//        webView.load(urlRequest)
//    }
//}
//
