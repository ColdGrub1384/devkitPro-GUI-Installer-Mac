//
//  ViewController.swift
//  devkitARM GUI Installer
//
//  Created by Adrian on 24.01.17.
//  Copyright © 2017 Adrian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func wntrmute(_ sender: Any) {
        NSWorkspace.shared().open(URL(string:"https://sourceforge.net/u/wntrmute/profile/")!)
    }
    
    @IBAction func Install(_ sender: Any) {
        let task = Process()
        task.launchPath = "/usr/bin/env"
        task.arguments = ["chmod +x '/Applications/devkitPro GUI Installer.app/Contents/Resources/devkit/Setup.sh'"]
        print(Run().runAsRoot(cmd:"'/Applications/devkitPro GUI Installer.app/Contents/Resources/devkit/Setup.sh'"))
    }
    
    @IBAction func Compile(_ sender: Any) {
        let finder = NSOpenPanel()
        finder.title = "Choose project"
        finder.canChooseDirectories = true
        finder.canChooseFiles = false
        finder.defaultButtonCell?.title = "Build"
        if finder.runModal() == NSModalResponseOK {
            print(Run().run(cmd: "source ~/.bashrc; make -C \(finder.url!.absoluteString.replacingOccurrences(of: "file://", with: "")); open \(finder.url!)"))
        }
    }
    
    @IBAction func Create(_ sender: Any) {
        let finder = NSOpenPanel()
        finder.title = "Choose where create project"
        finder.canChooseDirectories = true
        finder.canChooseFiles = false
        finder.defaultButtonCell?.title = "Create"
        if finder.runModal() == NSModalResponseOK {
            let result = finder.url
            let name = NSAlert()
            name.messageText = "Choose project's name"
            let textfield = NSTextField(frame: NSRect(x: 0, y: 0, width: 200, height: 24))
            name.accessoryView = textfield
            name.addButton(withTitle: "Ok")
            name.runModal()
            
            print(NSUserName())
            
            print((name.accessoryView as! NSTextField).stringValue)
            print(result!.absoluteString)
            print(Run().runAsRoot(cmd: "cp -r /opt/devkitpro/examples/3ds/templates/application \(result!.absoluteString.replacingOccurrences(of: "file://", with: ""))/\((name.accessoryView as! NSTextField).stringValue); sudo chmod 777 \(result!.absoluteString.replacingOccurrences(of: "file://", with: ""))\((name.accessoryView as! NSTextField).stringValue); sudo chmod 666 \(result!.absoluteString.replacingOccurrences(of: "file://", with: ""))\((name.accessoryView as! NSTextField).stringValue)/source/*; sudo chown \(NSUserName()) \(result!.absoluteString.replacingOccurrences(of: "file://", with: ""))\((name.accessoryView as! NSTextField).stringValue)/source; cp /opt/devkitpro/libctru/default_icon.png \(result!.absoluteString.replacingOccurrences(of: "file://", with: ""))/\((name.accessoryView as! NSTextField).stringValue)/; sudo chmod 666 \(result!.absoluteString.replacingOccurrences(of: "file://", with: ""))/\((name.accessoryView as! NSTextField).stringValue)/default_icon.png; sudo mv \(result!.absoluteString.replacingOccurrences(of: "file://", with: ""))/\((name.accessoryView as! NSTextField).stringValue)/default_icon.png \(result!.absoluteString.replacingOccurrences(of: "file://", with: ""))/\((name.accessoryView as! NSTextField).stringValue)/icon.png;"))
        }
    }
    

}
