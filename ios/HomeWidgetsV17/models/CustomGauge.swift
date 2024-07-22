//
//  CustomGauge.swift
//  HomeWidgetsExtension
//
//  Created by smartee on 28/08/2023.
//

import SwiftUI


struct CircularProgressView: View {
    let progress: Int
    let color: Color
    let center: Text?
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    color.opacity(0.5),
                    lineWidth: 5
                )
            Circle()
                .trim(from: 0, to: Double(progress)/100)
                .stroke(
                    color,
                    style: StrokeStyle(
                        lineWidth: 5,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: progress)
            if(center == nil){
                Text("\(progress)").font(.system(size: 32)).bold().foregroundColor(color).scaledToFit()
            }
            else{
                center
            }
        }
    }
}

struct CustomGauge_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0, color: .blue, center: nil)
    }
}
