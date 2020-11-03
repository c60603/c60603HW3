//
//  ContentView.swift
//  c60603HW3
//
//  Created by User04 on 2020/11/3.
//

import SwiftUI

struct ContentView: View {

        var roles=["基隆","台北","台中","高雄"]
        
        @State private var selectedName="一代目"
        @State private var selectedName2=0
        @State private var selectedIndex = 0
        @State private var scale: Array<CGFloat>=[1000,1000,1000,1000,1000]
        @State private var selectDate = Date()
        @State private var number = ""
        @State private var name = ""
        @State private var bgColor = Color.black
        @State private var changeColor = true
        @State private var gotoBrowser = false
        let roles2 = ["民宿", "飯店", "公寓", "青年旅館"]
        let today = Date()
        let startDate = Calendar.current.date(byAdding: .year, value: -2,to: Date())!
        var year: Int{
            Calendar.current.component(.year, from: selectDate)
        }
        var body: some View {
            NavigationView{
                GeometryReader{ geometry in
                    
                    VStack(){
                        
                        Image("City\(selectedIndex)").resizable().padding().scaledToFill().frame(width: geometry.size.width, height: 300).clipped()
                        
                        Form{
                               VStack{
                                Picker(selection: $selectedIndex, label: Text("選擇")){
                                    ForEach(roles.indices){
                                        (index) in
                                        Text(roles[index])
                                    }
                                
                                }.pickerStyle(SegmentedPickerStyle()).foregroundColor(bgColor)
                                
                                
                            }
                            HStack{
                                
                                Text("價錢").foregroundColor(bgColor)
                                Slider(value: $scale[selectedIndex],in:1000...20000)
                                Text("\(scale[selectedIndex], specifier: "$%.2f")").foregroundColor(bgColor)
                                }
                            HStack{
                                Picker("選擇住所類型",selection: self.$selectedName2){
                                                        ForEach(0..<roles2.count){(index) in
                                                            Text(self.roles2[index])}
                                    
                                }.foregroundColor(bgColor)
                            }
                            HStack{
                                DatePicker("住宿日期", selection: $selectDate, in: startDate...today, displayedComponents: .date).foregroundColor(bgColor)
                            }
                            HStack{
                                   Text("聯絡人:").foregroundColor(bgColor)
                                   TextField("name", text: $name)
                                                }
                    
                            HStack{
                                   Text("聯絡電話:").foregroundColor(bgColor)
                                   TextField("number", text: $number)
                                                }
                            Toggle("Want to Change Color?",isOn:$changeColor)
                            if changeColor{
                                ColorPicker("Choose Your Color", selection: $bgColor).frame(maxWidth: .infinity, maxHeight: 10).foregroundColor(bgColor)
                            }
                            
                            
                            
                        }
                            
                        
                        Button(action: {
                            gotoBrowser=true
                              }) {
                                
                                 HStack {
                                    Image(systemName: "magnifyingglass")
                                    Text("前往搜尋")
                                    Image(systemName: "magnifyingglass")
                                 }
                                       
                        }.alert(isPresented: $gotoBrowser){() ->Alert in
                            let answer=["www.google.com","www.yahoo.com.tw"].randomElement()!
                            return Alert(title: Text(answer))
                        }
                        .background(Color.yellow)
                        .cornerRadius(100)
                        
                    }
                            
                        
                        
                    }.navigationTitle("旅遊小幫手")
                    
                }
            }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
