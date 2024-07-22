//
//  HomeWidgetExample.swift
//  HomeWidgetExample
//
//  Created by Anton Borries on 04.10.20.
//

import SwiftUI
import WidgetKit

private let widgetGroupId = "group.borra_home_widget_v17"

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> ExampleEntry {
      ExampleEntry(date: Date(), text: "")
  }

  func getSnapshot(in context: Context, completion: @escaping (ExampleEntry) -> Void) {
    let data = UserDefaults.init(suiteName: widgetGroupId)
    let entry = ExampleEntry(
      date: Date(), text: data?.string(forKey: "title") ?? "")
    completion(entry)
  }

  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
    getSnapshot(in: context) { (entry) in
      let timeline = Timeline(entries: [entry], policy: .atEnd)
      completion(timeline)
    }
  }
}

struct ExampleEntry: TimelineEntry {
  let date: Date
  let text: String
}

struct HomeWidgetExampleEntryView: View {
  var entry: Provider.Entry
  let data = UserDefaults.init(suiteName: widgetGroupId)
  let iconPath: String?

  init(entry: Provider.Entry) {
    self.entry = entry
    iconPath = data?.string(forKey: "dashIcon")

  }

  var body: some View {
    VStack.init(
      alignment: .center, spacing: /*@START_MENU_TOKEN@*/ nil /*@END_MENU_TOKEN@*/,
      content: {

          Text(String(describing:convertStringToObject(entry.text, type: WidgetData.self)) )
          .font(.body)
          .frame(maxWidth: .infinity, alignment: .leading)
        if iconPath != nil {
          Image(uiImage: UIImage(contentsOfFile: iconPath!)!).resizable()
            .scaledToFill()
            .frame(width: 64, height: 64)
        }
      }
    )
  }
}

struct HomeWidgetsEntryView : View {
    var entry: Provider.Entry
    @State private var widgetData: WidgetData?
    @Environment(\.widgetFamily) var family
    
    init(entry: Provider.Entry) {
      self.entry = entry

    }
    
    var body: some View {
        Link(destination: URL(string: "myAppWidget://navigate?from=ios&homeWidget")!) {
            ZStack{
                switch family{
                case .systemSmall:
                    smallWidget(data: widgetData).onAppear{
                        widgetData = convertStringToObject(entry.text, type: WidgetData.self)
                    }
                case .systemMedium:
                    mediumWidget(data: widgetData).onAppear{
                        widgetData = convertStringToObject(entry.text, type: WidgetData.self)
                    }
                default:
                    largeWidget(data: widgetData).onAppear{
                        widgetData = convertStringToObject(entry.text, type: WidgetData.self)
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: AppColors.white, location: 0),
                            .init(color: Color(hex: 0xffF1F0FF), location: 1)
                        ]),
                        startPoint: .center,
                        endPoint: .bottom
                    )
                )
            
        }}
    

}

extension WidgetConfiguration {
    func contentMarginsDisabledIfAvailable() -> some WidgetConfiguration {
        if #available(iOSApplicationExtension 17.0, *) {
            return self.contentMarginsDisabled()
        } else {
            return self
        }
    }
}

@main
struct HomeWidgetsV17: Widget {
  let kind: String = "HomeWidgetsV17"

  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) {
        entry in
        if #available(iOSApplicationExtension 17.0, *) {
            HomeWidgetsEntryView(entry: entry).containerBackground(.fill.tertiary, for: .widget)}
        else {
            HomeWidgetsEntryView(entry: entry)
        }
    }
    .contentMarginsDisabledIfAvailable()
    .configurationDisplayName("오늘의 운세 위젯")
    .description("나의 오늘을 미리보기")
  }
}

struct HomeWidgetExample_Previews: PreviewProvider {
  static var previews: some View {
      HomeWidgetsEntryView(
      entry: ExampleEntry(date: Date(), text: "Example Data")
    )
    .previewContext(WidgetPreviewContext(family: .systemSmall))
  }
}

func fetchData(rawData: String) -> WidgetData? {
    if let jsonData = rawData.data(using: .utf8) {
        do {
            let decoder = JSONDecoder()
            let widgetData = try decoder.decode(WidgetData.self, from: jsonData)
            print(rawData);
            return widgetData
        } catch {
            print("Error parsing JSON: \(error.localizedDescription)")
        }
    }
    return nil
}


func convertStringToObject<T: Decodable>(_ jsonString: String, type: T.Type) -> T? {
    // Convert string to data
    
    guard let jsonData = jsonString.data(using: .utf8) else {
        print("Failed to convert string to data.")
        return nil
    }
    
    do {
        // Decode JSON data into object of specified type
        let object = try JSONDecoder().decode(type, from: jsonData)
        return object
    } catch {
        print("Error decoding JSON string: \(error.localizedDescription)")
        return nil
    }
}



func getFormattedDateAndMonth(format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale(identifier: "ko_KR")
    let currentDate = Date()
    return dateFormatter.string(from: currentDate)
}


