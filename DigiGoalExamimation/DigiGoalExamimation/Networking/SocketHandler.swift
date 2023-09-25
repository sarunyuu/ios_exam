//
//  SocketHandler.swift
//  DigiGoalExamimation
//
//  Created by Sarunyu Prasert on 25/9/2566 BE.
//

import SocketIO

class SocketHandler: NSObject {
  static let shared = SocketHandler()
  let socket = SocketManager(socketURL: AppConstants.socketURL, config: [.log(true), .compress])
  private var socketClient: SocketIOClient!
  
  override init() {
    super.init()
    socketClient = socket.defaultSocket
  }
  
  func getSocket() -> SocketIOClient {
    return socketClient
  }
  
  func establishConnection() {
    socketClient.connect()
  }
  
  func closeConnection() {
    socketClient.disconnect()
  }
  
}
