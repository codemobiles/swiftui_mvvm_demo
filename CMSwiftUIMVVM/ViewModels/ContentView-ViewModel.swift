//
//  ContentView-ViewModel.swift
//  CMSwiftUIMVVM
//
//  Created by Chaiyasit Tayabovorn on 12/7/2565 BE.
//

import Foundation

extension ContentView {
  
  @MainActor class ViewModel : ObservableObject{
    @Published var username = ""
    @Published var password = ""
    @Published var navigateToHomePage = false
    @Published var navigateToRegisterPage = false
    @Published var eventShowLoginFailedAlert = false
    
    
    func login(){
      if (username == "admin" && password == "1234"){
        navigateToHomePage = true
      }else{
        eventShowLoginFailedAlert = true
      }
    }
    
    func clear(){
      username = ""
      password = ""
    }
          
  }
}
