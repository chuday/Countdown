//
//  ContentView.swift
//  countdown
//
//  Created by Mikhail Chudaev on 18.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAddViewShow = false
    @ObservedObject var appViewModel = AppViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Text(Date.now.formatDate())
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color(hex: "727272"))
                
                HStack {
                    Text("today")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold))
                    
                    Spacer()
                    
                    HStack(spacing: -10) {
                        Rectangle()
                            .frame(width: 50, height: 2)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10)
                    }
                    .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(appViewModel.endDate)
                        .foregroundColor(Color(hex: "00A907"))
                        .font(.system(size: 40, weight: .bold))
                        .onTapGesture {
                            isAddViewShow.toggle()
                        }
                }
            }
            
            Spacer()
            Text(appViewModel.mainText)
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.white)

            Spacer()
        }
        .padding(.horizontal, 37)
        .padding(.vertical, 50)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(hex: "2d2d2d"))
        .sheet(isPresented: $isAddViewShow) {
            AddDateView()
                .environment(\.colorScheme, .dark)
                .presentationDetents([.height(600)])
                .environmentObject(appViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AddDateView: View {
    
    @State var selectDate = Date()
    @State var text = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appVieModel: AppViewModel
    
    var body: some View {
        
        VStack(spacing: 26) {
            DatePicker("", selection: $selectDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .padding()
                .background(Color(hex: "1c1c1e"))
                .cornerRadius(20)
            
            TextField("Date text", text: $text)
                .padding(30)
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
                .background(Color(hex: "1c1c1e"))
                .cornerRadius(20)
            
            Button {
                appVieModel.saveNewDateText(text: text, date: selectDate)
                dismiss()
            } label: {
                Text("set")
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .background(Color(hex: "00a907"))
                    .cornerRadius(20)
            }            
        }
        .padding(.horizontal, 20)
        .padding(.top, 30)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.black)
    }
}
