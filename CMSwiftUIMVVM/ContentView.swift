//
//  ContentView.swift
//  SwiftUIMVVM
//
//  Created by Chaiyasit Tayabovorn on 5/7/2565 BE.
//

import SwiftUI

struct ContentView: View {
   
  @StateObject private var viewModel = ViewModel()
  
  
  var body: some View {
    NavigationView {
      VStack{
        VStack{
          CMTextField(label: "Username", value: $viewModel.username)
          CMTextField(label: "Password", value: $viewModel.password)
          
          // Login
          Button(action: {
            viewModel.login()
          }) {
            Text("Login").frame(minWidth: 0, maxWidth: .infinity)
          }.buttonStyle(.borderedProminent)
          
          // Register
          CMButton(title: "Register") {
            print(viewModel.username)
            viewModel.navigateToRegisterPage = true
          }
          
          // Clear
          CMButton(title: "Clear") {
            viewModel.clear()
          }
          
          setupNavigationLinks()
        }.padding()
          .alert("Login Failed", isPresented: $viewModel.eventShowLoginFailedAlert) {
            
          } message: {
            Text("Not found this account: \(viewModel.username), \(viewModel.password)")
          }

        
      }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.white)
    }
  }
    
  
  func setupNavigationLinks()->some View {
    VStack{
      NavigationLink(destination: HomePage(), isActive: $viewModel.navigateToHomePage) {
        EmptyView()
      }
      
      NavigationLink(destination: RegisterPage(), isActive: $viewModel.navigateToRegisterPage) {
        EmptyView()
      }
    }
  }
}

struct CMTextField:View{
  var label:String
  @Binding var value:String
  
  var body: some View{
    HStack{
      Text("\(label):")
      TextField(label, text: $value)
        .textContentType(.emailAddress)
        .keyboardType(.emailAddress)
        .autocapitalization(.none)
    }
  }
}


struct CMButton:View{
  var title:String
  var callback: () -> Void
  
  var body: some View{
    Button(action: {
      callback()
    }) {
      Text(title).frame(minWidth: 0, maxWidth: .infinity)
    }.buttonStyle(.bordered)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
