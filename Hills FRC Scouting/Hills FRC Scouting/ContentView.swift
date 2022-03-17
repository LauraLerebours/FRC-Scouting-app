//
//  ContentView.swift
//  Hills FRC Scouting
//  FRC 3624 Scouting !CHANGE IT
//  Created by Laura Lerebours on 3/12/22.
//

import SwiftUI

import Foundation

struct ContentView: View {
    @ObservedObject var notificationManager = LocalNotificationManager()
    @FocusState private var teamIsFocused: Bool
    
    @State var showFootnote = false
    @StateObject var teamInput = Teams()
    
    //body of page
    var body: some View {
        NavigationView{
            VStack{
                Form{
                ScrollView{
                    Group{
                        TextField("Team Number",text: $teamInput.teamNumber)
                            .submitLabel(.next)
                            .keyboardType(.numberPad)
                            
                        TextField("Starting Spot", text: $teamInput.startingSpot)
                            .submitLabel(.continue)
                            
                        TextField("Balls During Autonomous", text: $teamInput.autoballs)
                            .keyboardType(.numberPad)
                            
                        TextField("Color Detection?", text: $teamInput.ballColorDetected)
                            
                        TextField("Floor Pickup?", text: $teamInput.ballPickUp)

                        TextField("Drop Balls In?", text: $teamInput.ballsDroppedIn)
                    }
                    .focused($teamIsFocused)
                    Group{
                        TextField("High Goal Shots", text: $teamInput.ballsInHighGoal)
                                .keyboardType(.numberPad)
                        TextField("Low Goal Shots", text: $teamInput.ballsInLowGoal)
                            .keyboardType(.numberPad)
                        TextField("Rungs Climbed", text: $teamInput.rungsClimbed)
                                .keyboardType(.numberPad)
                        
                        
                        TextField("Time", text: $teamInput.time)
                                .keyboardType(.numberPad)
                        
                        TextField("Penalties", text: $teamInput.penalties)
                                .keyboardType(.numberPad)
                    }
                    .focused($teamIsFocused)
                    
                    
                    Button(action : {
                        teamInput.addTeam()
                        withAnimation {
                        self.showFootnote.toggle()
                        self.notificationManager.sendNotification(title: "Hurray!", subtitle: nil, body: "If you see this text, launching the local notification worked!", launchIn: 5)
                        teamIsFocused = false
                                            }
                    }, label: {
                        Text("Add Team")
                            .frame(width: 300,
                                   height: 50,
                                   alignment: .center)
                        
                        
                    })
                    Button(action : {
                        
                    }, label: {
                        Text("Export")
                            .frame(width: 300,
                                   height: 50,
                                   alignment: .center)
                    })
                
                }
                .navigationTitle("Add Team Stats")
                    if showFootnote {
                        Group{
                            Text("Team added")
                            .font(.footnote)
                        }
                        .frame(width: 350, height: 50, alignment: .center)
                        .foregroundColor(Color.blue)
//                        team.sleep(time: 5.0)
//                        showFootnote.toggle()
                    }
                    
                }
//                .onSubmit(){
//                    guard teamInput.validate() else { return }
//                    validate(name: teamInput.teamNum)
//                }
            }
    
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
    
}



/*
 
 Menu("Menu") {
     Button(action : {
         
         
         
     }, label: {
         Text("New Team")
             .frame(width: 300,
                    height: 50,
                    alignment: .center)
         
     })
     Button(action : {
         
         
         
     }, label: {
         Text("Past Teams")
             .frame(width: 300,
                    height: 50,
                    alignment: .center)
         
     })
 }
 
 NavigationView {
     VStack{
         Form{
             Section{
                 TextField("Team Number", text: $teamNumber)
                 TextField("Starting Spot", text: $startingSpot)
             }
         }
     }
     .navigationTitle("Add Team")
 }

 
 
 
 
 let jsonString = "{\"location\": \"the moon\"}"

 if let documentDirectory = FileManager.default.urls(for: .documentDirectory,
                                                     in: .userDomainMask).first {
     let pathWithFilename = documentDirectory.appendingPathComponent("myJsonString.json")
     do {
         try jsonString.write(to: pathWithFilename,
                              atomically: true,
                              encoding: .utf8)
     } catch {
         // Handle error
     }
 }
 //        let decoder = JSONDecoder()
 //
 //        let data = jsonString.data(using: .utf8)!
 //        let teamInfo = try! decoder.decode(TeamInfo.self, from: data)
         
 func writeDataToFile(file:String)-> Bool{
  // check our data exists
     guard let data = textView.text else {return false}
     print(data)
     //get the file path for the file in the bundle
     // if it doesnt exisit, make it in the bundle
     var fileName = file + ".txt"
     if let filePath = NSBundle.mainBundle().pathForResource(file, ofType: "txt"){
         fileName = filePath
     } else {
        fileName = NSBundle.mainBundle().bundlePath + fileName
     }
     //write the file, return true if it works, false otherwise.
     do{
        try data.writeToFile(fileName, atomically: true, encoding: NSUTF8StringEncoding )
         return true
     } catch{
         return false
     }
 }
 */
