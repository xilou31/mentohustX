//
//  ContentView.swift
//  mentohustX
//
//  Created by 西楼 on 2020/10/14.
//

import SwiftUI
import Cocoa
import ShellOut

struct ContentView: View {
    var body: some View {
        GeometryReader{geometry in
            VStack{
                GeometryReader{geometry in
                    HStack{
                        UserName()
                            .frame(width: (geometry.size.width)*0.75, height: 100, alignment: .center)
                        Line1XConnect()
                            .frame(width: (geometry.size.width)*0.20, height: 100, alignment: .center)
                        Spacer()
                            .frame(width: (geometry.size.width)*0.05, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                    }
                }
                PassWord()
                NetWorkInterfaceCard()
                GeometryReader{geometry in
                    HStack{
                        SavePassWord()
                        Spacer()
                            .frame(width: geometry.size.width/2, height: 100, alignment: .center)
                        AutoConnnect()
                    }
                }
                GeometryReader { geometry in
                    HStack{
                        Connect()
                        Spacer()
                            .frame(width: geometry.size.width/2, height: 100, alignment: .center)
                        DisConnect()
                    }
                }
            }
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
        GeometryReader{geometry in
            HStack{
                Text("用户名")
                    .frame(width: (geometry.size.width)*0.2, height: 100, alignment: .center)
                TextField("请输入用户名", text: $userName)
                    .frame(width: (geometry.size.width)*0.8, height: 100, alignment: .center)
            }
        }
    }
}

struct PassWord:View {
    @State private var passWord:String = ""
    var body: some View{
        GeometryReader{geometry in
            HStack{
                Text("密码")
                    .frame(width: (geometry.size.width)*0.15, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
                SecureField("请输入密码", text:$passWord)
                    .frame(width: (geometry.size.width)*0.80, height: 100, alignment: .center)
                Spacer()
                    .frame(width: (geometry.size.width)*0.05, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .center)
            }
        }
    }
}

struct Line1XConnect:View {
    @State private var isLine1xConnect:Bool = true
    var body: some View{
        Toggle(isOn: $isLine1xConnect) {
            Text("有线1x连接")
        }.toggleStyle(SwitchToggleStyle())
    }
}

struct NetWorkInterfaceCard:View {
    var nicList = getInterfaceNames()
    @State private var selectedInterfaceTag = 1
    var body: some View{
        GeometryReader { geometry in
            HStack{
                Picker(selection: $selectedInterfaceTag, label: Text("网卡").frame(width: (geometry.size.width)*0.15, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/), content: {
                    ForEach(nicList.indices){index in
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text(nicList[index])
                        })
                    }
                }).frame(width: (geometry.size.width)*0.95, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Spacer()
                    .frame(width: (geometry.size.width)*0.05, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct Connect : View {
    func connect() -> Void{
        do{
            let output = try shellOut(to: "./mentohust",at: "/usr/local/sbin")
            print(output) // Hello world
        }catch{
            print(error)
        }
    }
    var body: some View{
        Button(action:connect, label: {
            Text("连接")
        })
    }
}

struct DisConnect:View {
    func disConnect() -> Void {
        do{
            let output = try shellOut(to: "./mentohust",arguments: ["-k"],at: "/usr/local/sbin")
            print(output)
        }catch{
            print(error)
        }
    }
    var body: some View{
        Button(action: disConnect, label:{
            Text("断开连接")
        })
    }
}

struct SavePassWord:View {
    @State private var isSavePassword:Bool = true
    var body: some View{
        Toggle(isOn:$isSavePassword, label: {
            Text("保存密码")
        }).toggleStyle(SwitchToggleStyle())
    }
}

struct AutoConnnect:View {
    @State private var isAutoConnect:Bool = true
    var body: some View{
        Toggle(isOn: $isAutoConnect, label: {
            Text("自动认证")
        }).toggleStyle(SwitchToggleStyle())
    }
}

func getInterfaceNames() -> [String] {
    
    var names = [String]()
    
    // Get list of all interfaces on the local machine:
    var ifaddr : UnsafeMutablePointer<ifaddrs>?
    guard getifaddrs(&ifaddr) == 0 else { return [] }
    guard let firstAddr = ifaddr else { return [] }
    
    // For each interface ...
    for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
        let addr = ptr.pointee.ifa_addr.pointee
        if addr.sa_family == UInt8(AF_LINK){
            let name = String(cString: ptr.pointee.ifa_name)
            names.append(name)
        }
    }
    
    return names
}
