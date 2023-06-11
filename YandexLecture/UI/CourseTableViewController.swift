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
    private let dateTodayFormatter = DateFormatter()

    private lazy var course: Course = {
       let storage = CourseStorage()
        return storage.load()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colorView
        navigationItem.title = course.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = colorYellow
        
        let standardAppearance = UINavigationBarAppearance()
        
        standardAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: colorYellow]
 
        standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: colorYellow]
        standardAppearance.backgroundColor = colorView
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
        dateTodayFormatter.dateFormat = "yyyy-MM-dd"
                                
        print(lecture.date)
        
        cell.labelTitle.text = "\(prefix) - \(lecture.name)"
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = colorView
            cell.labelTitle.textColor = colorYellow
            cell.labelDate.textColor = colorYellow
            cell.labelNamePosition.textColor = colorYellow
            
            let backGround = UIView()
            backGround.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            cell.selectedBackgroundView = backGround
        } else {
            cell.backgroundColor = #colorLiteral(red: 0.9098735777, green: 0.9098735777, blue: 0.9098735777, alpha: 0.8420758929)
            cell.labelTitle.textColor = .black
            cell.labelDate.textColor = .black
            cell.labelNamePosition.textColor = .black
        }
        
        let test = dateTodayFormatter.string(from: Date())

        if let date = dateFormatterGet.date(from: lecture.date){
            if dateTodayFormatter.string(from: date) == test {
                cell.backgroundColor = colorYellow
                cell.labelTitle.textColor = colorView
                cell.labelDate.textColor = colorView
                cell.labelNamePosition.textColor = colorView
            }
            cell.labelDate.text = dateFormatterPrint.string(for: date)
        }
        
        cell.labelNamePosition.text = lecture.namePosition
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lecture = course.lectures[indexPath.row]
        let lectureVC = LectureViewController()
        lectureVC.lecture = lecture
        
        navigationController?.pushViewController(lectureVC, animated: true)
        
    }
}



