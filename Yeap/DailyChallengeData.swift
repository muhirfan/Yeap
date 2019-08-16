//
//  DailyChallengeData.swift
//  Yeap
//
//  Created by Agatha Rachmat on 16/08/19.
//  Copyright © 2019 House of Do. All rights reserved.
//

import Foundation

enum ModuleType: String {
    case integrity, respect, humbleness, discipline, willingness
}

enum stageLevel: Int {
    case one = 1
    case two
    case three
    case four
    case five
}

struct Content {
    var modul : ModuleType
    var challenge : String
    var stage: stageLevel
}

class ChallengeData: NSObject,NSCoding {
    
    override init() {
        
    }
    func encode(with aCoder: NSCoder) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
    }
    
    let dataIntegrity = [
        ["Spend time with someone you care of, talk about what they like.", "Accountable. If you making a mistake, no matter what, admit it and say sorry in front of them", "Kind. Go visit someone who need comfort, and hug them.","Find Solution. Disagreement during discussion is natural, if you had one, find solution. Resolve it and make peace.","Generous. Give your money to those who need the most immediately"],
        ["Genuine. Set your own style today, be truthful about it, and be consistent.", "Raise others up. Ask someone today goals, guide them to achieve it today.","Helpfull. Open the door for someone, make sure they pass it before you closed it.","Reliable. Ask for a task, then finished it accordingly.","Promote others. Time to give praise because they deserve it. Speak to them, and share the moment."]
    ]
    
    let dataRespect = [
        ["Listening to others agony without patronising them. Have empathy.","Proud of someone you care for sincerely. Share how good they are to your friends", "Keep your word. Start your day by make promise to those closest to you. At the end of the day, make that promise happen.", "Be on time for any activities that you do.", "Fight Fair. Listen to the argument and respond rationally."],
        ["tba","tba","tba","tba","tba"]
    ]

    let dataHumbleness = [
        ["Ask for help of what you don’t know or can’t do, give thanks to those who help you afterwards instantly","Challenge your own perspective against facts. Embrace what you’ve discover and learned from it.","Recognise when wrong","Open to other people’s viewpoints.","Able to compromise"],
        ["tba","tba","tba","tba","tba"]
    ]
//    var bases: [String] {
//        get {
//            return data[0]
//        }
//    }
//
//    var proteins: [String] {
//        get {
//            return data[1]
//        }
//    }
   
   /*
    "Ask for help of what you don’t know or can’t do, give thanks to those who help you afterwards instantly"
    "Be organised. Start organising your clothes orderly in your wardrobe according to what is used daily"
    "Try new things. Start your day early, end it late. Or walk backward for 50 meters."
    */


   
}
