//
//  ViewController.swift
//  TableView
//
//  Created by 김하람 on 2023/09/29.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - 1. tableView 인스턴스 생성
    let tableViewUI: UITableView = {
        let tableVIew = UITableView()
        tableVIew.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        tableVIew.translatesAutoresizingMaskIntoConstraints = false
        return tableVIew
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        // MARK: - 3. dataSource, delegate 생성
        tableViewUI.dataSource = self
        tableViewUI.delegate = self
        setUI()
    }

    func setUI(){
        let title: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "TableView"
            label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
            label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            return label
        }()
        
        view.addSubview(title)
        view.addSubview(tableViewUI)
        
        // MARK: - 4. cell 등록하기
        tableViewUI.register(DemoCell.self, forCellReuseIdentifier: "Cell")
        tableViewUI.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableViewUI.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 30),
            tableViewUI.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableViewUI.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableViewUI.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
    }
}
// MARK: - 2. tableView extension 생성
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MockData.modeling[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewUI.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DemoCell else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = MockData.modeling[indexPath.section][indexPath.row].title
        let imageName = MockData.modeling[indexPath.section][indexPath.row].name
        cell.imageView?.image = UIImage(named: imageName)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return MockData.modeling.count
    }
    
    //    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "hi"
    //    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70.0
    }

        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView()
            // 이때는 꺼야함.... 이것때문에 삽질...
//            headerView.translatesAutoresizingMaskIntoConstraints = false
            headerView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    
            let headerTitle = UILabel()
            headerTitle.translatesAutoresizingMaskIntoConstraints = false
            headerTitle.text = "Section \(section)"
            headerTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            headerTitle.textColor = .white
    
            headerView.addSubview(headerTitle)
    
            NSLayoutConstraint.activate([
                headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0),
                headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 8),
                headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -8),
                headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0)
            ])
    
            return headerView
        }
    
    }
