//
//  Teams.swift
//  Hills FRC Scouting
//
//  Created by Laura Lerebours on 3/16/22.
//

import Foundation
import SwiftUI
class Teams: ObservableObject {
    @State var teamNumber = ""
    @State var startingSpot = ""
    @State var autoballs = ""
    @State var ballColorDetected = ""
    @State var ballPickUp = ""
    @State var ballsDroppedIn = ""
    @State var ballsInHighGoal = ""
    @State var ballsInLowGoal = ""
    @State var rungsClimbed = ""
    @State var time = ""
    @State var penalties = ""
    func addTeam(){
        let ballColor = makeBool(condition:ballColorDetected)
        let floorBalls = makeBool(condition: ballPickUp)
        let droppedBalls = makeBool(condition: ballsDroppedIn)
        let teams = TeamInfo(teamNumber: teamNumber, startingSpot: startingSpot, autoballs: autoballs, ballColorDetected: ballColor, ballPickUp: floorBalls, ballsDroppedIn: droppedBalls, ballsInHighGoal: ballsInHighGoal, ballsInLowGoal: ballsInLowGoal, rungsClimbed: rungsClimbed, time: time, penalties: penalties )
        let jsonString = """
        {"\(teams.teamNumber)": {"startingSpot": \(teams.startingSpot), "autoBalls": \(teams.autoBalls), "ballColor": \(teams.ballColorDetected), "floorBalls": \(teams.ballPickUp), "droppedBalls": \(teams.ballsDroppedIn), "highBalls": \(teams.ballsInHighGoal), "lowBalls": \(teams.ballsInLowGoal), "rungsClimbed": \(teams.rungsClimbed), "timeTaken": \(teams.time), "penalties": \(teams.penalties)},
        """
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            let pathWithFilename = documentDirectory.appendingPathComponent("scoutingData.json")
                do {
                    try jsonString.write(to: pathWithFilename,
                                         atomically: true,
                                         encoding: .utf8)
                    print(jsonString)
                } catch {
                    print("File error")
                }
        }
        
    }
    func makeBool(condition: String) -> Bool{
        if(condition == "Yes" || condition == "yes"){
            return true
        } else{
            return false
        }
    }
    func sleep(time: Double){
        Thread.sleep(forTimeInterval: time)
    }
}

struct TeamInfo: Codable {
    var teamNumber : String
    var startingSpot: String
    var autoBalls: String
    var ballColorDetected: Bool
    var ballPickUp: Bool
    var ballsDroppedIn: Bool
    var ballsInHighGoal: String
    var ballsInLowGoal: String
    var rungsClimbed: String
    var time : String
    var penalties: String
    
    init(teamNumber: String, startingSpot: String, autoballs: String, ballColorDetected: Bool,ballPickUp: Bool, ballsDroppedIn: Bool, ballsInHighGoal: String, ballsInLowGoal: String, rungsClimbed: String, time: String, penalties: String){
        self.teamNumber = teamNumber
        self.startingSpot = startingSpot
        self.autoBalls = autoballs
        self.ballColorDetected = ballColorDetected
        self.ballPickUp = ballPickUp
        self.ballsDroppedIn = ballsDroppedIn
        self.ballsInHighGoal = ballsInHighGoal
        self.ballsInLowGoal = ballsInLowGoal
        self.rungsClimbed = rungsClimbed
        self.time = time
        self.penalties = penalties
    }
    
}

extension TeamInfo: CustomStringConvertible{
    var description: String {
        return "\(teamNumber), Started:\(startingSpot),Does it detect balls?:\(ballColorDetected),Amount of balls during autonomous:\(autoBalls), Does it pick up balls?:\(ballPickUp), Does it drop balls in?:\(ballsDroppedIn), Amount of balls in the high goal:\(ballsInHighGoal), Amount of balls in low goal:\(ballsInLowGoal), Rungs Climbed:\(rungsClimbed), Time: \(time), Penalties: \(penalties)"
    }
}
