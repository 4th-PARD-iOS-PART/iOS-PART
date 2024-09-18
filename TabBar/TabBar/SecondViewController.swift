import UIKit

class SecondViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
    
    func setUI(){
        
        let image: UIImageView = {
            let image1 = UIImageView()
            // systemImage의 크기를 조정하기 위해서는 symbolConfiguration을 지정해야 한다.
            let imageSize = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
            image1.translatesAutoresizingMaskIntoConstraints = false
            image1.image = UIImage(systemName: "moon", withConfiguration: imageSize)
            image1.tintColor = .systemYellow
            image1.contentMode = .scaleAspectFit
            return image1
        }()
        
        view.addSubview(image)
        
        
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
