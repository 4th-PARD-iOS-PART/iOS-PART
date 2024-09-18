import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setTabBar()
    }
    
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        
        self.viewControllers = [vc1, vc2, vc3]
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = .gray
        
        guard let tabBarItems = self.tabBar.items else {return}
        tabBarItems[0].image = UIImage(systemName: "face.smiling")
        tabBarItems[1].image = UIImage(systemName: "moon.fill")
        tabBarItems[2].image = UIImage(systemName: "pawprint.fill")
        tabBarItems[0].title = "smile"
        tabBarItems[1].title = "moon"
        tabBarItems[2].title = "pawprint"
    }


}

