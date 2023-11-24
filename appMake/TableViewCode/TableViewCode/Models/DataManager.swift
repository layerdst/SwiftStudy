//
//  DataManager.swift
//  TableViewCode
//
//  Created by 김재영 on 2023/11/24.
//

import UIKit

class DataManager {
    var movieArr : [Movie] = []
    
    func makeData (){
        movieArr = [
            Movie(UIImage(named: "batman.png"), "배트맨",  "배트맨이 출현하는 영화"),
            Movie(UIImage(named: "captain.png"), "캡틴 아메리카",  "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?"),
            Movie(UIImage(named: "ironman.png"),  "아이언맨",  "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미있는 영화"),
            Movie(UIImage(named: "thor.png"),"토르",  "아스가르드의 후계자 토르가 지구에 오게되는 스토리"),
            Movie(UIImage(named: "hulk.png"),"헐크", "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
            Movie(UIImage(named: "spiderman.png"), "스파이더맨", "피터 파커 학생에서 스파이더맨이 되는 과정을 담은 스토리"),
            Movie(UIImage(named: "blackpanther.png"),  "블랙펜서", "와칸다의 왕위 계승자 티찰과 블랙펜서가 되다."),
            Movie(UIImage(named: "doctorstrange.png"), "닥터스트레인지",  "외과의사 닥터 스트레인지가, 히어로가 되는 과정을 담은 영화"),
            Movie(UIImage(named: "guardians.png"),  "가디언즈 오브 갤럭시",  "빌런 타노스에 맞서서 세상을 지키려는 가오겔 멤버들")
        ]
    }
    
    func getMovieData() -> [Movie]{
        return movieArr
    }
    
}
