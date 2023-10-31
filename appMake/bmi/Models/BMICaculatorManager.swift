import UIKit

struct BMICaculatorManager{
    
    var bmi : BMI?
    
    mutating func getBMI(height : String, weight : String) -> BMI {
        calculateBMI(height : height, weight : weight)
        return bmi ?? BMI(value: 0.0, advice: "문제발생", matchColor: .white)
    }
    
    mutating func calculateBMI(height : String, weight : String){
        guard let h = Double(height), let w = Double(weight) else {
            bmi = BMI(value : 0.0, advice : "문제발생", matchColor: .white)
            return
        }
        
        var bmiNum = w / (h * h) * 10000
        bmiNum = round(bmiNum * 10) / 10
        
        switch bmiNum {
        case ..<18.6 :
            let color = UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
            bmi = BMI(value : bmiNum, advice : "저체중", matchColor: color)
        case 18.6 ..< 23.0 :
            let color = UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
            bmi = BMI(value : bmiNum, advice : "표준", matchColor: color)
        case 25.0..<30.0 :
            let color = UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
            bmi = BMI(value : bmiNum, advice : "표준", matchColor: color)
        case 30.0... :
            let color = UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
            bmi = BMI(value : bmiNum, advice : "저체중", matchColor: color)
        default:
            bmi = BMI(value: 0.0,  advice: "문제발생", matchColor: .white)
        }
        
    }
    
    func getBMIResult() -> BMI {
        return bmi ?? BMI(value: 0.0,  advice: "문제발생", matchColor: .white)
    }
    
//    mutating func calculateBMI(height : String, weight : String)  {
//        guard let h = Double(height), let w = Double(weight) else {
//            bmi = 0.0
//            return
//        }
//        var bmiNumber  = w / (h * h) * 10000
//        bmi = round(bmiNumber*10) / 10
//    }
//
//    func getBackgroudColor() -> (UIColor, String) {
//        guard let bmi = bmi else {return (UIColor.black, "없음")}
//        switch bmi {
//        case ..<18.6 :
//            return (UIColor.blue, "저체중")
//        case 18.6..<23.0 :
//            return (UIColor.green, "미달")
//        case 23.0..<25.0 :
//            return (UIColor.yellow, "정상")
//        case 25.0..<30.0 :
//            return (UIColor.magenta, "과체중")
//        case 30.0... :
//            return (UIColor.red, "비만")
//        default : return (UIColor.black, "없음")
//        }
//    }
    
    
}
