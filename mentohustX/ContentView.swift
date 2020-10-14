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

struct <#name#> {
    <#fields#>
}
