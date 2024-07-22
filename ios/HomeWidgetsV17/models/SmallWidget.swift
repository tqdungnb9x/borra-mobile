//
//  SmallWidget.swift
//  HomeWidgetsExtension
//
//  Created by smartee on 24/08/2023.
//

import SwiftUI

//MARK: - SMALL WIDGET
struct smallWidget : View {
var data: WidgetData?
init(data: WidgetData?) {
    self.data = data
}
@State private var completion: Double = 0.7 // Giá trị phần trăm (từ 0 đến 1)

var body: some View{
    if(data == nil){
        Text("No data")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxHeight: .infinity)
                    .background(
                        Color.clear
                            .onTapGesture {
                                guard URL(string: "myAppWidget://navigate?from=ios&homeWidget") != nil else { return }
                                // Open URL using WidgetCenter
//                                    WidgetCenter.shared.open(URL)
                            }
                    )
    } else {
        VStack(alignment: .leading, spacing: 0){
            Text(getFormattedDateAndMonthSmall(format:"EEEE")).foregroundColor(.black)
            Text(getFormattedDateAndMonthSmall(format: "M/dd")).foregroundColor(.black).fontWeight(.heavy)
            CircularProgressView(progress: Int(data?.today?.first?.score ?? "0")!, color: AppColors.blue, center: nil).scaledToFit().frame(maxWidth: .infinity, alignment: .trailing)
        }.onTapGesture {
            // Handle tap action here, such as opening a URL
            guard URL(string: "myAppWidget://navigate?from=ios&homeWidget") != nil else { return }
        }.padding()
    }
}
}


struct SmallWidget_Previews: PreviewProvider {
    static var previews: some View {
        smallWidget(data: nil)
    }
}

func getFormattedDateAndMonthSmall(format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale(identifier: "ko_KR")
    let currentDate = Date()
    return dateFormatter.string(from: currentDate)
}
