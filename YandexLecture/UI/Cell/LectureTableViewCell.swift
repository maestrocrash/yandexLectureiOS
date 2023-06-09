//
//  LectureCellTableView.swift
//  YandexLecture
//
//  Created by MICHAIL SHAKHVOROSTOV on 08.06.2023.
//

import UIKit

class LectureTableViewCell: UITableViewCell {
    
    private let yellowProject = #colorLiteral(red: 0.9903424382, green: 0.8046727777, blue: 0.003792768111, alpha: 1)
    
    let labelTitle: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelDate: UILabel = {
       let label = UILabel()
        label.font = .italicSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelNamePosition: UILabel = {
       let label = UILabel()
        label.textAlignment = .right
        label.font = .italicSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         
        setupView()
        setupConstraints()
         
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension LectureTableViewCell {
    
    private func setupView() {
       addSubview(labelTitle)
       addSubview(labelDate)
       addSubview(labelNamePosition)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            labelTitle.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
           
            
            labelDate.leadingAnchor.constraint(equalTo: labelTitle.leadingAnchor),
            labelDate.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            labelDate.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 8),
            labelDate.heightAnchor.constraint(equalToConstant: 15),
            labelDate.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            labelNamePosition.trailingAnchor.constraint(equalTo: labelTitle.trailingAnchor),
            labelNamePosition.bottomAnchor.constraint(equalTo: labelDate.bottomAnchor),
            labelNamePosition.heightAnchor.constraint(equalTo: labelDate.heightAnchor),
            labelNamePosition.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 8),
            labelNamePosition.widthAnchor.constraint(equalTo: labelDate.widthAnchor)
            
        ])
        
        
    }
    
}
