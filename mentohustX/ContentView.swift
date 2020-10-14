//
//  ContentView.swift
//  mentohustX
//
//  Created by 西楼 on 2020/10/14.
//

import SwiftUI
import Cocoa

struct ContentView: View {
    var body: some View {
        VStack{
            UserName()
            PassWord()
            NetWorkInterfaceCard()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UserName:View {
    @State private var userName:String = ""
    var body: some View{
        HStack{
            Text(verbatim: "用户名")
            TextField("请输入用户名", text: $userName)
        }
    }
}

struct PassWord:View {
    @State private var passWord:String = ""
    var body: some View{
        HStack{
            Text(verbatim: "密码")
            SecureField("请输入密码",text:$passWord)
        }
    }
}

struct NetWorkInterfaceCard:View {
    @State private var selectedCardTag:Int = 1
    var body: some View{
        Picker(selection: $selectedCardTag, label:Text(verbatim: "网卡"), content: {
            Text("1").tag(1)
            Text("2").tag(2)
        })
    }
}
