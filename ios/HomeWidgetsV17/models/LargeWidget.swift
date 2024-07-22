//
//  LargeWidget.swift
//  HomeWidgetsExtension
//
//  Created by smartee on 24/08/2023.
//

import SwiftUI

//MARK: - LARGE WIDGET
struct largeWidget: View{
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
                    Text(data?.today?.first?.word ?? "").foregroundColor(.black).multilineTextAlignment(.center).font(.system(size: 26)).lineLimit(hasSmallSize() ? 2 : 3).fixedSize(horizontal: false, vertical: true).frame(maxWidth: .infinity, alignment: .center).padding(.all, 20)
                    Text(getFormattedDateAndMonthLarge(format: "yy.MM.dd")).foregroundColor(.black).padding(.horizontal, 16)
                    Spacer().frame(height: 10)
                    
                    HStack{
                        Text("\(data?.today?.first?.score ?? "")점").font(.system(size: 12)).fontWeight(.bold)
                            .padding(5).background(AppColors.blue.opacity(0.2)).cornerRadius(10).foregroundColor(AppColors.blue)
                        Text(data?.today?.first?.scoreName ?? "").foregroundColor(.black).truncationMode(.tail).lineLimit(1)
                        Spacer()
                        Circle()
                            .fill(AppColors.cadetBlue)
                            .frame(width: 20, height: 20)
                            .overlay(Image(systemName: "chevron.right").scaleEffect(0.7).foregroundColor(AppColors.white))
                    }.padding(.horizontal, 16)
                    
                    
                    
                    Spacer().frame(height: 16)
                    Divider().padding(.horizontal, 16)
                    Spacer().frame(height: hasSmallSize() ? 13 : 33)
                    
                    HStack{
                        Spacer().frame(width: 41)
                        
                        VStack{
                            CircularProgressView(progress: Int(data?.fortune?.love.contents ?? "0")!, color: AppColors.salmon, center: Text(data?.fortune?.love.contents ?? "0").font(.system(size: 28)).bold().foregroundColor(AppColors.salmon))
                            Spacer().frame(height: 12)

                            Text(data?.fortune?.love.name ?? "").foregroundColor(.black).font(.system(size: 14)).scaledToFill().minimumScaleFactor(0.1).lineLimit(1)

                            
                            
                        }.frame(maxWidth: .infinity)
                        
                        
                        Spacer().frame(width:  30)
                        
                        VStack{
                            CircularProgressView(progress: Int(data?.fortune?.money.contents ?? "0")!, color: AppColors.pastelOrange, center: Text(data?.fortune?.money.contents ?? "0").font(.system(size: 28)).bold().foregroundColor(AppColors.pastelOrange))
                            Spacer().frame(height: 12)
                            Text(data?.fortune?.money.name ?? "").foregroundColor(.black).font(.system(size: 14)).scaledToFill().minimumScaleFactor(0.1).lineLimit(1)
                            }.frame(maxWidth: .infinity)
                        
                        Spacer().frame(width:  30)
                        VStack{
                            CircularProgressView(progress: Int(data?.fortune?.health.contents ?? "0")!, color: AppColors.maximumBlueGreen, center: Text(data?.fortune?.health.contents ?? "0").font(.system(size: 28)).bold().foregroundColor(AppColors.maximumBlueGreen))
                            Spacer().frame(height: 12)
                            Text(data?.fortune?.health.name ?? "").foregroundColor(.black).font(.system(size: 14)).scaledToFill().minimumScaleFactor(0.1).lineLimit(1)
                            
                        }.frame(maxWidth: .infinity)
                        Spacer().frame(width: 41)
                        
                    }.frame(maxHeight: .infinity)
                    
                }.padding()}
            }
        }

    struct LargeWidget_Previews: PreviewProvider {
        static var previews: some View {
            largeWidget(data: nil)
        }
    }
    

func hasSmallSize() -> Bool {
        let screenWidth = UIScreen.main.nativeBounds.size.width
        let screenHeight = UIScreen.main.nativeBounds.size.height
    if UIDevice.current.userInterfaceIdiom == .phone {
        return (screenWidth <= 750 || screenHeight <= 1334)
    }
    return (screenWidth <= 1536 || screenHeight <= 2048);
    }

func getFormattedDateAndMonthLarge(format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale(identifier: "ko_KR")
    let currentDate = Date()
    return dateFormatter.string(from: currentDate)
}
