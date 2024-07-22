//
//  MediumWidget.swift
//  HomeWidgetsExtension
//
//  Created by smartee on 24/08/2023.
//

import SwiftUI


//MARK: - MEDIUM WIDGET
struct mediumWidget: View{
    var data: WidgetData?
    init(data: WidgetData?) {
        self.data = data
    }
    var body: some View{
        
        if(data == nil)
        {
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
                HStack {
                    if (UIDevice.current.userInterfaceIdiom == .pad)
                    {
                        Text(data?.today?.first?.word ?? "").foregroundColor(.black).fontWeight(.bold).fixedSize(horizontal: false, vertical: true).frame(maxWidth: UIScreen.main.bounds.width/2, alignment: .topLeading)
                        
                    } else {
                        Text(data?.today?.first?.word ?? "").foregroundColor(.black).fontWeight(.bold).fixedSize(horizontal: false, vertical: true).frame(width: UIScreen.main.bounds.width/2, alignment: .topLeading)
                    }
       
                    Circle()
                        .fill(AppColors.cadetBlue)
                                    .frame(width: 20, height: 20)
                                    .overlay(Image(systemName: "chevron.right").scaleEffect(0.7).foregroundColor(AppColors.white)).frame(maxWidth: .infinity, alignment:.topTrailing).frame(height: 50, alignment: .topTrailing)

                }
                Spacer()
                HStack {
                    VStack(alignment: .leading){
                        Text(getFormattedDateAndMonthMedium(format: "yy년 M월 d일")).foregroundColor(.black)
                        Text(data?.today?.first?.scoreName ?? "").foregroundColor(.black).lineLimit(1).truncationMode(.tail)
                    }
                    Spacer()
                    HStack( alignment: .lastTextBaseline, spacing: 0){
                        Text(data?.today?.first?.score ?? "").font(.system(size: 40)).foregroundColor(AppColors.blue)
                        Text("점").foregroundColor(AppColors.blue)
                    }
                }
            }.onTapGesture {
                // Handle tap action here, such as opening a URL
                guard URL(string: "myAppWidget://navigate?from=ios&homeWidget") != nil else { return }
            }.padding()
        }
      
    }
}


struct MediumWidget_Previews: PreviewProvider {
    static var previews: some View {
        mediumWidget(data: nil)
    }
}

func getFormattedDateAndMonthMedium(format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale(identifier: "ko_KR")
    let currentDate = Date()
    return dateFormatter.string(from: currentDate)
}
