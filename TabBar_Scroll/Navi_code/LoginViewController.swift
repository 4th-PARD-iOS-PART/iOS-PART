//
//  ViewController.swift
//  Navi_code
//
//  Created by 김하람 on 2023/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeUI();
    }

    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .black
        button.tintColor = .white
        button.setTitle("LOGIN", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    func makeUI(){
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 140),
            nextButton.heightAnchor.constraint(equalToConstant: 40),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonPressed(){
        
        let tabBarVC = UITabBarController()
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = SecondViewController()
        let vc3 = ThirdViewControllerr()
        
        vc1.title = "First"
        vc2.title = "nice"
        vc3.title = "happy"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .lightGray
        
        // 아이템이 있으면 아이템을, 없으면 else문을 반환한다.
        guard let items = tabBarVC.tabBar.items else { return }
        // tabBarVC에 있는 배열에 순서대로 접근하여 각 아이템에 접근
        items[0].image = UIImage(systemName: "square.and.arrow.up")
        
        items[1].image = UIImage(systemName: "arrowshape.right")
        items[2].image = UIImage(systemName: "bookmark.circle.fill")
    
        present(tabBarVC, animated: true, completion: nil)
    }
}
