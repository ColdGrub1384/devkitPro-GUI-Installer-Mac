//
//  RunAsRoot.swift
//  devkitARM GUI Installer
//
//  Created by Adrian on 24.01.17.
//  Copyright © 2017 Adrian. All rights reserved.
//

import Cocoa

class Run {
    var error: NSDictionary?
    
    func runAsRoot(cmd:String) -> NSDictionary? {
        NSAppleScript(source: "do shell script \"sudo \(cmd)\" with administrator " +
            "privileges")!.executeAndReturnError(&error)
        if error != nil {
            return error
        }else {
            return nil
        }
    }
    
    func run(cmd:String) -> NSDictionary? {
        NSAppleScript(source: "do shell script \"\(cmd)\"")!.executeAndReturnError(&error)
        if error != nil {
            return error
        }else {
            return nil
        }
    }
}
