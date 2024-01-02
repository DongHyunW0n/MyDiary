//
//  WriteDiaryViewController.swift
//  MyDiary
//
//  Created by WonDongHyun on 1/2/24.
//

import UIKit
import SwiftUI


class WriteDiaryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    


}



// 프리뷰 보려고 스유로 래핑함.

struct WriteDiaryViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> WriteDiaryViewController {
        return WriteDiaryViewController()
    }
    
    func updateUIViewController(_ uiViewController: WriteDiaryViewController, context: Context) {
        // 뷰 컨트롤러를 업데이트해야 하는 경우 업데이트합니다.
    }
}

struct WriteDiaryViewControllerWrapper_Preview: PreviewProvider {
    static var previews: some View {
        WriteDiaryViewControllerWrapper()
        
    }
}

