//
//  main.swift
//  speechrecognizermac
//
//  Created by pebble8888 on 2016/12/21.
//  Copyright © 2016年 pebble8888. All rights reserved.
//

import Foundation
import AppKit


class Dispatcher:  NSObject, NSSpeechRecognizerDelegate {
    var stop: Bool
    override init () {stop = false}
    func speechRecognizer(_ sender: NSSpeechRecognizer,
                          didRecognizeCommand command: String) {
        print("command: \(command)")
        stop = true
    }
}

let dispatcher = Dispatcher()

let recognizer = NSSpeechRecognizer()!
recognizer.delegate = dispatcher
recognizer.commands = ["Hello", "こんにちは", "Bonjour", "你好"]
recognizer.startListening()

let loop = RunLoop.current
let mode = loop.currentMode ?? RunLoopMode.defaultRunLoopMode
while loop.run(mode: mode, before: NSDate(timeIntervalSinceNow: 0.1) as Date) 
    && !dispatcher.stop {}
