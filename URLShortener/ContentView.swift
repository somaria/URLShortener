//
//  ContentView.swift
//  URLShortener
//
//  Created by admin on 14/8/21.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var viewModel = ViewModel()
  
  @State var text: String = ""
  
  @ViewBuilder
  func header() -> some View {
    VStack {
      Text("Enter URL to be shortened")
        .bold()
        .font(.system(size: 26))
        .foregroundColor(.white)
        .padding()
      
      TextField("URL...", text: $text)
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .padding()
      
      Button {
        viewModel.submit(urlString: text)
//        print(viewModel.models[0].long)
      } label: {
        Text("Submit URL")
          .bold()
          .foregroundColor(.white)
          .frame(width: 240, height: 50)
          .background(Color.pink)
          .cornerRadius(8)
          .padding()
      }

    }
    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    .background(Color.blue)
  }
  
    var body: some View {
      NavigationView {
        ScrollView(.vertical) {
          header()

          ForEach(viewModel.models, id:\.self) { model in
            Text("test")
            Text(model.long)
            Text(model.short)
          }
          
        }
        .navigationTitle("URL Shortener")
      }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


