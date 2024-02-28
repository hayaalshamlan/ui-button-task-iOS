


import UIKit
import SnapKit

class ViewController : UIViewController {
    
    let imageView = UIImageView()
    let TextField = UITextField()
    let loadImageButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.addSubview(TextField)
        view.addSubview(loadImageButton)
        setupUI()
        loadImageButton.addTarget(self, action: #selector(loadImageButtonTapped), for: .touchUpInside)
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
            make.height.equalTo(imageView.snp.width)
        }
        
        TextField.placeholder = "Enter image name here"
        TextField.borderStyle = .roundedRect
        view.addSubview(TextField)
       TextField.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        loadImageButton.setTitle(" Image", for: .normal)
        loadImageButton.backgroundColor = .blue
        loadImageButton.layer.cornerRadius = 5
        loadImageButton.setTitleColor(.white, for: .normal)
        view.addSubview(loadImageButton)
        loadImageButton.snp.makeConstraints { make in
            make.top.equalTo(TextField.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
    }
    
    @objc func loadImageButtonTapped() {
        if let imageName = TextField.text, !imageName.isEmpty {
            if let image = UIImage(named: imageName) {
                imageView.image = image
            } else {
                print("Image with name '\(imageName)' not found.")
            }
        }
    }
}
