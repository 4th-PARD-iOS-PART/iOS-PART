import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setUI()
    }

    func setUI(){
        let scrollView: UIScrollView = {
            let scrollViews = UIScrollView()
            scrollViews.translatesAutoresizingMaskIntoConstraints = false
            return scrollViews
        }()
        
        let contentView: UIView = {
            let contents = UIView()
            contents.translatesAutoresizingMaskIntoConstraints = false
            return contents
        }()
        
        let label: UILabel = {
            let labels = UILabel()
            labels.translatesAutoresizingMaskIntoConstraints = false
//            labels.text = "hello"
            labels.text = "hello"
            labels.font = .systemFont(ofSize: 50, weight: .heavy)
            return labels
        }()
        
        let image1: UIImageView = {
            let images = UIImageView()
//            images.translatesAutoresizingMaskIntoConstraints = false
            images.translatesAutoresizingMaskIntoConstraints = false
            images.image = UIImage(named: "Bbang")
//            images.image = UIImage(systemName: "wand.and.rays")
            images.contentMode = .scaleAspectFit
            return images
        }()
        
        let image2: UIImageView = {
            let images = UIImageView()
            images.translatesAutoresizingMaskIntoConstraints = false
            images.image = UIImage(named: "monster")
            images.contentMode = .scaleAspectFit
            return images
        }()
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(label)
        contentView.addSubview(image1)
        contentView.addSubview(image2)
        
        // 결국 scrollview의 핵심은 layout.
        NSLayoutConstraint.activate([
            // scrollview의 constraint를 safeArea를 기준으로
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            // 이때, bottomanchor를 뷰의 bottomAnchor로 주면 끝까지 스크롤영역
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // contentView의 autoLayout. scrollView를 따라 설정
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // contents들.
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            
            image1.topAnchor.constraint(equalTo: label.topAnchor, constant: 30),
            image1.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 30),
            image1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20),
            
            image2.topAnchor.constraint(equalTo: image1.topAnchor, constant: 350),
            image2.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            image2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            image2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
        ])
        
        // 이 부분이 중요하다. 세로 스크롤뷰의 가장 큰 특징은 '높이'를 동적으로 지정한다는 것.
        // contentView의 height를 이렇게 지정해줘야 한다. contentview의 높이가 view보다 크거나 같아야 한다는 것.
        // Q. scrollview의 높이는 지정하지 않아도 되나요?
            // Yes. scrollview는 명시적 제약을 주지 않아도 컨텐츠에 따라 동적으로 조절한다.
//        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
//        // 제약조건 충돌 시 우선순위에 따라 실행되는데, 우선순위를 낮게 둔 것.
//        contentViewHeight.priority = .defaultLow
//        contentViewHeight.isActive = true
        
    }
}

