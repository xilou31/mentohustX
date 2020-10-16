//
//  MentohustConf.swift
//  mentohustX
//
//  Created by 西楼 on 2020/10/16.
//

import Foundation

struct MentohustConf {
    var Username:String = ""
    var Password:String = ""
    var Nic:String = ""
    var IP:String = ""
    var Mask:String = "255.255.255.0"
    var Gateway:String = "0.0.0.0"
    var DNS:String = "0.0.0.0"
    var PingHost:String = "0.0.0.0"
    var Timeout:String = "8"
    var EchoInterval:String = "30"
    var RestartWait:String = "15"
    var MaxFail:String = "8"
    var StartMode:String = ""
    var DhcpMode:String = ""
    var DaemonMode:String = ""
    var Version:String = "0.00"
    var DataFile:String = "/etc/mentohust.conf"
    var DhcpScript:String = "dhclient"
    
    init() {
        
    }
    
    init(Username:String,Password:String,Nic:String) {
        self.Username = Username
        self.Password = Password
        self.Nic = Nic
    }
    
    init(Username:String,Password:String,Nic:String,IP:String,Mask:String,Gateway:String,DNS:String,PingHost:String,Timeout:String,EchoInterval:String,RestartWait:String,MaxFail:String,StartMode:String,DhcpMode:String,DaemonMode:String,Version:String,DataFile:String,DhcpScript:String) {
        self.Username = Username
        self.Password = Password
        self.Nic = Nic
        self.IP = IP
        self.Mask = Mask
        self.Gateway = Gateway
        self.DNS = DNS
        self.PingHost = PingHost
        self.Timeout = Timeout
        self.EchoInterval = EchoInterval
        self.RestartWait = RestartWait
        self.MaxFail = MaxFail
        self.StartMode = StartMode
        self.DhcpMode = DhcpMode
        self.DaemonMode = DaemonMode
        self.Version = Version
        self.DataFile = DataFile
        self.DhcpScript = DhcpScript
    }
    
    func writeToConfFile(){
        let filePath:String = NSHomeDirectory() + "/etc/mentohust.conf"
        let conf:String = """
            
            [MentoHUST]
            Username=\(Username)
            Password=\(Password)
            Nic=\(Nic)
            IP=\(IP)
            Mask=\(Mask)
            Gateway=\(Gateway)
            DNS=\(DNS)
            PingHost=\(PingHost)
            TimeOut=\(Timeout)
            EchoInterval=\(EchoInterval)
            RestartWait=\(RestartWait)
            MaxFail=\(MaxFail)
            StartMode=\(StartMode)
            DhcpMode=\(DhcpMode)
            DaemonMode=\(DaemonMode)
            Version=\(Version)
            DataFile=\(DataFile)
            DhcpScript=\(DhcpScript)
        """
        try! conf.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
    }
    
    func printConf() {
        let conf:String = """
            
            [MentoHUST]
            Username=\(Username)
            Password=\(Password)
            Nic=\(Nic)
            IP=\(IP)
            Mask=\(Mask)
            Gateway=\(Gateway)
            DNS=\(DNS)
            PingHost=\(PingHost)
            TimeOut=\(Timeout)
            EchoInterval=\(EchoInterval)
            RestartWait=\(RestartWait)
            MaxFail=\(MaxFail)
            StartMode=\(StartMode)
            DhcpMode=\(DhcpMode)
            DaemonMode=\(DaemonMode)
            Version=\(Version)
            DataFile=\(DataFile)
            DhcpScript=\(DhcpScript)
        """
        print(conf)
    }
}
