import SwiftUI

struct RingShape: Shape {
    var percent: Double
    let startAngle: Double
    
    typealias AnimatableData = Double
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    init(percent: Double = 100, startAngle: Double = -90) {
        self.percent = percent
        self.startAngle = startAngle
    }
    
    static func percentToAngle(percent: Double, startAngle: Double) -> Double {
        return (percent / 100 * 360) + startAngle
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(height, width) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Self.percentToAngle(percent: percent, startAngle: startAngle)
        
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
        }
    }
}

struct RingShapeWithFixedArrow: View {
    var percent: Double
    var startAngle: Double
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let radius = min(height, width) / 2
            let center = CGPoint(x: width / 2, y: height / 2)
            let startAngleRadians = startAngle * .pi / 180
            
            let arrowX = center.x + radius * cos(CGFloat(startAngleRadians))
            let arrowY = center.y + radius * sin(CGFloat(startAngleRadians))
            
            ZStack {
                RingShape(percent: percent, startAngle: startAngle)
                    .stroke(Color.blue, lineWidth: 10)
                
                Image(systemName: "arrow.right")
                    .position(x: arrowX, y: arrowY)
            }
        }
    }
}

#Preview {
    RingShapeWithFixedArrow(percent: 75, startAngle: -90)
        .frame(width: 200, height: 200)
}
