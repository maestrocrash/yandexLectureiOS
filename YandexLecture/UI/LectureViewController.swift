//
//  LectureViewController.swift
//  YandexLecture
//
//  Created by MICHAIL SHAKHVOROSTOV on 08.06.2023.
//

import UIKit

class LectureViewController: UIViewController {
    
    let backgroundView = #colorLiteral(red: 0.02744890936, green: 0.02745261975, blue: 0.09043943137, alpha: 1)
    let yellowProject = #colorLiteral(red: 0.9903424382, green: 0.8046727777, blue: 0.003792768111, alpha: 1)
    
    let dateFormatterGet = DateFormatter()
    let dateFormatterPrint = DateFormatter()
    
    private lazy var contentView: UIView = {
        let content = UIView()
        content.backgroundColor = yellowProject
        content.layer.cornerRadius = 10
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var labelNameTeacher: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 23)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelTeacherPosition: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelDate: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageAvatar: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "sun")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var textView: UITextView = {
        
        
        
        let text = UITextView()
        text.isEditable = false
        text.isScrollEnabled = false
        text.backgroundColor = backgroundView
        text.layer.borderColor = yellowProject.cgColor
        text.layer.borderWidth = 2
        text.layer.cornerRadius = 10
        text.sizeToFit()
        
        text.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    var lecture: Lecture? {
        didSet {
            if isViewLoaded {
                setup(with: lecture)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraint()
    }
    
}

extension LectureViewController {
    
    private func setupView() {
        
        view.backgroundColor = backgroundView
        view.addSubview(textView)
        view.addSubview(contentView)
        contentView.addSubview(labelNameTeacher)
        contentView.addSubview(labelDate)
        contentView.addSubview(labelTeacherPosition)
        contentView.addSubview(imageAvatar)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        setup(with: lecture)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            contentView.heightAnchor.constraint(equalToConstant: 120),
            
            labelNameTeacher.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            labelNameTeacher.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            labelNameTeacher.trailingAnchor.constraint(equalTo: imageAvatar.leadingAnchor, constant: -8),
            
            labelTeacherPosition.leadingAnchor.constraint(equalTo: labelNameTeacher.leadingAnchor),
            labelTeacherPosition.topAnchor.constraint(equalTo: labelNameTeacher.bottomAnchor, constant: 2),
            labelTeacherPosition.trailingAnchor.constraint(equalTo: labelNameTeacher.trailingAnchor),
            labelTeacherPosition.heightAnchor.constraint(equalToConstant: 30),
            
            labelDate.leadingAnchor.constraint(equalTo: labelNameTeacher.leadingAnchor),
            labelDate.bottomAnchor.constraint(equalTo: imageAvatar.bottomAnchor),
            // labelDate.topAnchor.constraint(equalTo: labelNamePosition.bottomAnchor, constant: 5),
            labelDate.trailingAnchor.constraint(equalTo: labelNameTeacher.trailingAnchor),
            
            
            imageAvatar.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            imageAvatar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imageAvatar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            imageAvatar.widthAnchor.constraint(equalTo: imageAvatar.heightAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            textView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            //            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
            //textView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    
    private func setup(with lecture: Lecture?) {
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatterPrint.dateFormat = "E, dd MMMM, yyyy в HH:mm"
        
        if let lecture {
            
            if let date = dateFormatterGet.date(from: lecture.date) {
                print(dateFormatterPrint.string(from: date))
                labelDate.text = dateFormatterPrint.string(for: date)
            }
            
            labelNameTeacher.text = lecture.namePosition
            labelTeacherPosition.text = lecture.position
            
            if let urlImage = lecture.avatar {
                imageAvatar.load(url: URL(string: urlImage)!)
            }
            let font = UIFont.systemFont(ofSize: 16)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .justified
            paragraphStyle.firstLineHeadIndent = 15.0
            paragraphStyle.lineSpacing = 4.0
            paragraphStyle.headIndent = 5.0
            paragraphStyle.paragraphSpacing = 10.0
            paragraphStyle.baseWritingDirection = .natural
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .foregroundColor: UIColor.white,
                .paragraphStyle: paragraphStyle
            ]
            
            textView.attributedText =  NSAttributedString(string: lecture.description, attributes: attributes)
            //textView.text = lecture.description
            
            navigationItem.title = lecture.name
        } else {
            textView.text = nil
            navigationItem.title = nil
        }
        
        
    }
}


extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
