//
//  LectureViewController.swift
//  YandexLecture
//
//  Created by MICHAIL SHAKHVOROSTOV on 08.06.2023.
//

import UIKit

class LectureViewController: UIViewController {

    private var textView: UITextView!
    
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
        textView = UITextView()
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 17)
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(textView)
        navigationController?.navigationBar.prefersLargeTitles = true
        setup(with: lecture)
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        
        ])
    }
    
    
    private func setup(with lecture: Lecture?) {
        
        if let lecture {
            textView.text = lecture.description
            navigationItem.title = lecture.name
        } else {
            textView.text = nil
            navigationItem.title = nil
        }
        
        
    }
}
