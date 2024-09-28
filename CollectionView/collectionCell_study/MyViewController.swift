//
//  ViewController.swift
//  collectionCell_study
//
//  Created by 진세진 on 2023/07/21.
// collectioview 다시 만들기 자자 기본만 잘 알면 충분히 가능하다!!!

/*
 
 UICollectionView DataSource
 컬렉션뷰 데이터소스 객체는 컬렉션뷰와 관련하여 가장 중요한 객체이며, 필수로 제공해야 합니다.
 컬렉션뷰의 콘텐츠(데이터)를 관리하고 해당 콘텐츠를 표현하는 데 필요한 뷰를 만듭니다. 데이터소스 객체를 구현하려면 UICollectionViewDataSource 프로토콜을 준수하는 객체를 만들어야 합니다.
 //지정된 섹션에 표시할 항목의 개수를 묻는 메서드.
 /**필수 메서드**/
 func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int

 //컬렉션뷰의 지정된 위치에 표시할 셀을 요청하는 메서드.
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
 /**주요 선택 메서드**/

 //컬렉션뷰의 섹션의 개수를 묻는 메서드. 이 메서드를 구현하지 않으면 섹션 개수 기본 값은 1.
 optional func numberOfSections(in collectionView: UICollectionView) -> Int

 //지정된 위치의 항목을 컬렉션뷰의 다른 위치로 이동할 수 있는지를 묻는 메서드.
 optional func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool

 //지정된 위치의 항목을 다른 위치로 이동하도록 지시하는 메서드.
 optional func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
 델
 
 */

import UIKit

class MyViewController: UIViewController{
    let cellidentifier = "cell"
   
    let label : UILabel = {
        let label = UILabel()
        //자동 오토레이징 마스크제한 팔스
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "PARD"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .center
        // labelview의 외부 데코레이션
        label.layer.cornerRadius = 25
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.gray.cgColor
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //추가된 부분
        collectionview.dataSource = self
        collectionview.delegate = self
        
        collectionview.register(CustomCell.self, forCellWithReuseIdentifier: cellidentifier)
        
        view.addSubview(label)
        view.addSubview(collectionview)
      
        setUP()
    }
    let collectionview : UICollectionView = {
        //새로 추가
        let flowlayout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView(frame: .infinite, collectionViewLayout: flowlayout)
        //새로 추가
        collectionview.backgroundColor = .white
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        return collectionview
    }()
    func setUP(){
        //새로 추가
        let collectioviewConstraints = [
            collectionview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            collectionview.widthAnchor.constraint(equalToConstant: view.bounds.width),
            collectionview.heightAnchor.constraint(equalToConstant: view.bounds.height / 2.0),
        ]
        let labelConstraints = [
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.heightAnchor.constraint(equalToConstant: 50),
        ]
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(collectioviewConstraints)
    }
   
}
extension MyViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Model.ModelData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionview.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath) as? CustomCell else{
            print("error using collectioview")
            return UICollectionViewCell()
        }
        cell.backgroundColor = .white
        let target = Model.ModelData[indexPath.item]
        let image = UIImage(named: "\(target.image).jpeg")
        cell.imageView.image = image
        cell.label.text = target.title
        return cell
    }
}
extension MyViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth : CGFloat = 100
        let itemHeight: CGFloat = 150
        return CGSize(width: itemWidth, height: itemHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 45, bottom: 5, right: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // 수평 간격
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // 수직 간격
        return 8
    }
}
