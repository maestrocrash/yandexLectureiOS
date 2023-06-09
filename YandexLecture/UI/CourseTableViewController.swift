//
//  CourseTableViewController.swift
//  YandexLecture
//
//  Created by MICHAIL SHAKHVOROSTOV on 08.06.2023.
//

import UIKit

class CourseTableViewController: UITableViewController {
    
    private lazy var cellID: String = "cellID"
    private let dateFormatterGet = DateFormatter()
    private let dateFormatterPrint = DateFormatter()

    let backgroundView = #colorLiteral(red: 0.02744890936, green: 0.02745261975, blue: 0.09043943137, alpha: 1)
    let yellowProject = #colorLiteral(red: 0.9903424382, green: 0.8046727777, blue: 0.003792768111, alpha: 1)

    private lazy var course: Course = {
       let storage = CourseStorage()
        return storage.load()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundView
        navigationItem.title = course.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = yellowProject
        
        let standardAppearance = UINavigationBarAppearance()
        
        standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: yellowProject]
 
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: yellowProject]
        standardAppearance.backgroundColor = backgroundView
        navigationController?.navigationBar.standardAppearance = standardAppearance
        
        let backItem = UIBarButtonItem()
        backItem.title = course.name
        navigationItem.backBarButtonItem = backItem
        
        tableView.register(LectureTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 
        return course.lectures.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! LectureTableViewCell
        
        cell.accessoryType = .disclosureIndicator
        
        let lecture = course.lectures[indexPath.row]
        let prefix = String(format: "%02d", indexPath.row)
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatterPrint.dateFormat = "E, dd MMMM, yyyy в HH:mm"
        
        
        cell.labelTitle.text = "\(prefix) - \(lecture.name)"
        
        if let date = dateFormatterGet.date(from: lecture.date) {
            print(dateFormatterPrint.string(from: date))
            cell.labelDate.text = dateFormatterPrint.string(for: date)
        }
        
        cell.labelNamePosition.text = lecture.namePosition
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = backgroundView
            cell.labelTitle.textColor = yellowProject
            cell.labelDate.textColor = yellowProject
            cell.labelNamePosition.textColor = yellowProject
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.9098735777, green: 0.9098735777, blue: 0.9098735777, alpha: 0.8420758929)
            cell.labelTitle.textColor = .black
            cell.labelDate.textColor = .black
            cell.labelNamePosition.textColor = .black
        }

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lecture = course.lectures[indexPath.row]
        let lectureVC = LectureViewController()
        lectureVC.lecture = lecture
        
        navigationController?.pushViewController(lectureVC, animated: true)
        
    }
}



