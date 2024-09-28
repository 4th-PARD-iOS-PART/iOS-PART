//
//  FirstViewController.swift
//  ram_Navi_code
//
//  Created by 김하람 on 2023/07/23.
//

import UIKit

class FirstViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUi()
    }
    
    // 네비게이션 바를 코드로 설정하기
    func makeUi() {
        view.backgroundColor = .systemYellow
        
        // 네비게이션 바의 틴트 색상을 파란색으로 설정합니다.
//        navigationController?.navigationBar.tintColor = .blue
        
        let navigationBarAppearance = UINavigationBarAppearance()
        // UINavigationBarAppearance 객체를 생성하고 네비게이션 바의 불투명한 배경 설정을 준비합니다.
        navigationBarAppearance.configureWithOpaqueBackground()

        // 각 뷰 컨트롤러의 네비게이션 바 외관을 설정합니다.
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        
        // scroll이 될 때 네비게이션 바의 색상을 brown으로 설정합니다.
        navigationBarAppearance.backgroundColor = .white
        navigationItem.standardAppearance = navigationBarAppearance
        
        
        // MARK: - 3. compactAppearance
//        navigationItem.compactAppearance = navigationBarAppearance
        

        // 네비게이션 컨트롤러의 상태 바 외관이 변경되었을 때, 상태 바를 새로고침(refresh)하도록 요청하는 메서드입니다. iOS 앱은 상태 바에 시간, 배터리 상태 등을 표시합니다. 네비게이션 컨트롤러의 상태 바 외관을 변경하거나 업데이트할 때, 시스템은 이 메서드를 호출하여 상태 바의 외관을 업데이트합니다.
        // 일반적으로, 네비게이션 바의 불투명성, 배경색, 이미지 등의 외관을 변경하려면 변경한 후에 setNeedsStatusBarAppearanceUpdate() 메서드를 호출하여 변경 사항이 상태 바에 반영되도록 합니다.
        navigationController?.setNeedsStatusBarAppearanceUpdate()

        navigationController?.navigationBar.isTranslucent = false
        
        title = "First"
        
        // MARK: - 이 지점 윗 부분은 수정하지 않음
        let myScrollView = UIScrollView()
        myScrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myScrollView)
        
        // MARK: - 스크롤뷰 auto layout
        NSLayoutConstraint.activate([
            myScrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            myScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            myScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            myScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])

        // MARK: - 스크롤뷰 content 추가
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemYellow
        myScrollView.addSubview(contentView)
        
        // MARK: - contentView의 오토레이아웃 설정
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: myScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: myScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: myScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor),
        ])

        // MARK: - contentView에 추가할 content 생성 및 설정
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD Welcome to PARD"
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        
        // MARK: - 스크롤 방향 설정
//        label.setContentCompressionResistancePriority(.required, for: .vertical)
        contentView.addSubview(label)
        
        let imageView = UIImageView(image: UIImage(named: "flower"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        
        let image2 = UIImageView(image: UIImage(named: "girl"))
        image2.translatesAutoresizingMaskIntoConstraints = false
        image2.contentMode = .scaleAspectFit
        contentView.addSubview(image2)
        
        
        // MARK: - contentView 안의 contents의 오토레이아웃 설정
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
            imageView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 400),
            
            image2.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 400),
            image2.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 20),
            image2.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            image2.heightAnchor.constraint(equalToConstant: 400),
            contentView.bottomAnchor.constraint(greaterThanOrEqualTo: image2.bottomAnchor, constant: 500)
        ])
    }
    
}
