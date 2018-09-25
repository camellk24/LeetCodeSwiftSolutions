import UIKit
import PlaygroundSupport

let points = [CGPoint(x: 1, y: 2),
              CGPoint(x: 3, y: 4),
              CGPoint(x: 5, y: 6),
              CGPoint(x: 7, y: 8)]


class LineChart: UIView {
  
  var xAxisCount = 20
  var yAxisCount = 20
  
  var plottedPoints: [UIView] = []
  
  override func draw(_ rect: CGRect) {
  
    let width: CGFloat = self.bounds.width
    let height: CGFloat = self.bounds.height
    
    let minX: CGFloat = 0.0
    let maxX: CGFloat = width
    
    let minY: CGFloat = 0.0
    let maxY: CGFloat = height
    
    let xCellLength: CGFloat = width / CGFloat(xAxisCount)
    let yCellLength: CGFloat = height / CGFloat(yAxisCount)
    
    let lineWidth:CGFloat = 1.0
    
    let context = UIGraphicsGetCurrentContext()!
    
    context.setLineWidth(lineWidth)
    context.setStrokeColor(UIColor.black.cgColor)
    
    // draw horizontal lines
    for i in stride(from: minX, through: maxX, by: xCellLength) {
      context.move(to: CGPoint(x: minX, y: xCellLength + i))
      context.addLine(to: CGPoint(x: maxX, y: xCellLength + i))
    }
    
    // draw vertical lines
    for i in stride(from: minY, through: maxY, by: yCellLength) {
      context.move(to: CGPoint(x: i + yCellLength, y: minY))
      context.addLine(to: CGPoint(x: i + yCellLength, y: maxY))
    }
    context.strokePath()
    
    context.setLineWidth(2.0)
    // draw x-axis
    context.move(to: CGPoint(x: minX, y: maxY / 2))
    context.addLine(to: CGPoint(x: maxX, y: maxY / 2))
    
    // draw y-axis
    context.move(to: CGPoint(x: maxX / 2, y: minY))
    context.addLine(to: CGPoint(x: maxX / 2, y: maxY))
    
    // draw lines
    context.strokePath()
  }
  
  
  func plot(_ point: CGPoint) {
    let radius: CGFloat = 5
    let x = point.x * (self.bounds.width / CGFloat(xAxisCount)) + self.bounds.width / 2
    let y = self.bounds.height / 2 - point.y * (self.bounds.height / CGFloat(yAxisCount))
    let rect = CGRect(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2)
    let dotView = UIView(frame: rect)
    dotView.layer.cornerRadius = radius
    dotView.backgroundColor = UIColor.red
    addSubview(dotView)
    plottedPoints.append(dotView)
  }
  
  func plot(_ points: [CGPoint]) {
    for point in points {
      plot(point)
    }
  }
  
  func clearPoints() {
    for view in plottedPoints {
      view.removeFromSuperview()
    }
  }
  
}

let lineChartView = LineChart(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
lineChartView.plot(points)
lineChartView.backgroundColor = .white
PlaygroundPage.current.liveView = lineChartView
