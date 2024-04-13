//
//  ProgressChart.swift
//  Agilo
//
//  Created by Pavly Paules on 12/04/2024.
//

import SwiftUI
import Charts

struct ProgressChart: View {
    @State var geo: CGSize = .zero
    @State private var selection_ca2: String = "Dec"
    var body: some View {
        VStack(alignment: .leading, spacing:0) {
            VStack(alignment: .center, spacing:5) {
                HStack(alignment: .center, spacing:0) {
                    HStack(alignment: .center, spacing:0) {
                        Image(systemName: "heart.fill")
                          .font(.system(size: 16, weight: .regular))
                          .imageScale(.small)
                          .foregroundColor(.white)
                          .frame(width: 24, height: 24)
                        Text("Heart Rate")
                        // MARK: Add SFProDisplay-Semibold file to Xcode, and reference it below:
                          .font(.custom("SFProDisplay-Semibold", size: 13))
                          .tracking(0.89)
                          .foregroundColor(.white)
                          .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(width: .infinity, height: .infinity, alignment: .leading)
                    Spacer()
                    SegmentedControlView(selection: $selection_ca2, items: ["Dec","Jan","Feb"], selectedSegmentTintColor: Color(hex: 0x974c84, alpha: 1), selectedSegmentTextColor: Color(hex: 0xffffff, alpha: 1))
                    .scaleEffect(0.8)
                    .frame(maxHeight: .infinity)
                    .frame(width: 178 + 6, height: .infinity)
                    .clipped()
                    .offset(x: 13)
                }
                .padding(.leading, 6)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 32, alignment: .center)
                .background(.clear)
                .clipped()
                VStack(alignment: .leading, spacing:0) {}
                .frame(width: geo.width * 0.95, height: 1, alignment: .topLeading)
                .background(.white)
                .opacity(0.2)
                .clipped()
                VStack(alignment: .leading, spacing:0) {
                    Data()
                }
                .frame(maxWidth: .infinity, minHeight: geo.height - (32 + 1) - (32) - (5), alignment: .topLeading)
                .frame(width: .infinity, alignment: .topLeading)
                .clipped()
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 8)
            .frame(maxWidth: .infinity, maxHeight:  .infinity, alignment: .top)
            .frame(width: .infinity, height: .infinity, alignment: .top)
            .background(LinearGradient(gradient:
            Gradient(stops: [.init(color: Color(hex: 0xff5457, alpha: 1), location: CGFloat(0)), .init(color: Color(hex: 0xff7cd2, alpha: 1), location: CGFloat(1))])
            , startPoint: UnitPoint(x: 0.1786061951567302, y: 0.883022221559489), endPoint: UnitPoint(x: 0.8213938048432697, y: 0.11697777844051105))
            )
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
            .stroke(Color(hex: 0x000000, alpha: 1), style: StrokeStyle(lineWidth: 1, lineJoin: .round))
            .opacity(0.05)
            )
            .shadow(color: Color(hex: 0x000000, alpha: 0.18), radius: 49, x: 2, y: 2)
            .saveSize(in: $geo)
        }
        .frame(width: 315, height: 175)
    }
    
    public struct Data: View {
        private var chartData_pli: [PlayChartPoint] = [  .init(x: 01, y: 14.75, category: "Item 1"), .init(x: 10, y: 18.32, category: "Item 1"), .init(x: 15, y: 8.13, category: "Item 1"), .init(x: 20 , y: 44.12, category: "Item 1"), .init(x: 27.00, y: 30.51, category: "Item 1"), .init(x: 28.00, y: 27.43, category: "Item 1"),]
        
        var body: some View {
            Chart {
                ForEach(chartData_pli) { item in
                    LineMark(
                    x: .value("x", item.x),
                    y: .value("y", item.y)
                    )
                      .foregroundStyle(by: .value("Category", item.category))
                }
                .interpolationMethod(.monotone)
            }
            .chartForegroundStyleScale(
            domain: ["Item 1", "Item 2", "Item 3"],
            range: [.white, Color(hex: 0xffffff, alpha: 0.2), Color(hex: 0xffffff, alpha: 0.05)]
                )
                .chartXAxis{
                AxisMarks(
                content: { value in
                    AxisGridLine()
                    AxisTick()
                }
                )
            }
            .chartYAxis{
            AxisMarks(
            position: .leading,
            content: { value in
                AxisValueLabel()
            }
            )
        }
        .chartLegend(.hidden)
        .frame(height: .infinity)
        .environment(\.colorScheme, .dark)
    }
}
    // MARK: additional structs
    struct SegmentedControlView: UIViewRepresentable {
        @Binding var selection: String
        var items: [String]
        var selectedSegmentTintColor: Color?
        var selectedSegmentTextColor: Color?
        class Coordinator: NSObject {
            var parent: SegmentedControlView
            init(parent: SegmentedControlView) {
                self.parent = parent
            }
            @objc func valueChanged(_ sender: UISegmentedControl) {
                applyAppearanceSettings(to: sender)
            }
            func applyAppearanceSettings(to segmentedControl: UISegmentedControl) {
                if let selectedSegmentTintColor = parent.selectedSegmentTintColor {
                    segmentedControl.selectedSegmentTintColor = UIColor(selectedSegmentTintColor)
                }
                if let textColor = parent.selectedSegmentTextColor {
                    let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(textColor)]
                    segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
                }
            }
        }
        func makeUIView(context: Context) -> UISegmentedControl {
            let control = UISegmentedControl(items: items)
            control.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
            context.coordinator.applyAppearanceSettings(to: control) // Apply colors initially
            return control
        }
        func updateUIView(_ uiView: UISegmentedControl, context: Context) {
            uiView.selectedSegmentIndex = items.firstIndex(of: selection) ?? 0
        }
        func makeCoordinator() -> Coordinator {
            return Coordinator(parent: self)
        }
    }
    struct PlayChartPoint: Identifiable {
        var x: Double
        var y: Double
        var category: String
        var id = UUID()
    }
}
extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}
// MARK: Allows for percentage based layouts
struct SizeCalculator: ViewModifier {
    @Binding var size: CGSize
    func body(content: Content) -> some View {
        content
          .background(
        GeometryReader {
            proxy in
            Color.clear
            .onAppear {
                size = proxy.size
            }
        }
        )
    }
}
extension View {
    func saveSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
}


#Preview {
    ProgressChart()
}
