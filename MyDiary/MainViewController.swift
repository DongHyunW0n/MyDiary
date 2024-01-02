//
//  MainViewController.swift
//  MyDiary
//
//  Created by WonDongHyun on 12/31/23.
//

import UIKit
import FSCalendar
import SwiftUI

class MainViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(hexCode: "F8F7F3")
        
        setCalendar()
        setLine1()
        setFloatingButton()
    }
    
    
    
    private lazy var calendarview : FSCalendar = {
        
        let calendar = FSCalendar()
        calendar.scope = .week
        calendar.weekdayHeight = 30
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.titleDefaultColor = .black
        calendar.dataSource = self
        calendar.delegate = self
        calendar.appearance.headerDateFormat = "YYYY. MM"
        calendar.backgroundColor = .gray
        
        return calendar
    }()
    
    private lazy var line1 : UIView = {
        
        let line = UIView()
        line.backgroundColor = .black
        
        return line
        
        
    }()
    
    private lazy var diaryPreview : UIView = {
        
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .lightGray
        
        
        return view
    }()
    
    private lazy var floatingButton : UIButton = {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.setBackgroundColor(.red, for: .normal)
        button.tintColor = .white // Adjust the color as needed
        
       
        return button
    }()
    
    private lazy var previewSection : UIView = {
        
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
  
    
    
    func setCalendar(){ //달력 관련 뷰 설정
        
        calendarview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calendarview)
        NSLayoutConstraint.activate([
        
            calendarview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendarview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            calendarview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            calendarview.heightAnchor.constraint(equalToConstant: 160)
        
        ])
        
    }
    
    func setLine1(){ //달력 밑에 검은색 줄 설정
        
        line1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line1)
        NSLayoutConstraint.activate([
        
            line1.topAnchor.constraint(equalTo: calendarview.bottomAnchor, constant: 20),
            line1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            line1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            line1.heightAnchor.constraint(equalToConstant: 1)
        
        ])
    }
    
    func setFloatingButton(){ //우측 하단에 위치한 플로팅 버튼 설정
        
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(floatingButton)
        NSLayoutConstraint.activate([
        
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            floatingButton.heightAnchor.constraint(equalToConstant: 50),
            floatingButton.widthAnchor.constraint(equalToConstant: 50)
        
        ])
        floatingButton.layer.cornerRadius = 25
        floatingButton.clipsToBounds = true
        
    }

    
 

}

extension MainViewController : FSCalendarDataSource {
    
    
}

extension MainViewController : FSCalendarDelegate {
    
    
}








extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}


extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}












// 프리뷰 보려고 스유로 래핑함.

struct CalendarViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainViewController {
        return MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
        // 뷰 컨트롤러를 업데이트해야 하는 경우 업데이트합니다.
    }
}

struct CalendarViewController_Preview: PreviewProvider {
    static var previews: some View {
        CalendarViewControllerWrapper()
        
    }
}

