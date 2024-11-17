//
//  SearchCollegeView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/17/24.
//


import SwiftUI

struct SearchCollegeView: View {
    
    @State var text = ""
    @State var isEditing = false
    
    var body: some View {
        VStack{
            
            
            
            VStack{
                List(SchoolSelectViewModel.allCases, id: \.self) { college in
                    
                    CollegeCell(college: college)
                    
                }
            }
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(.gray)
        }
        .navigationBarHidden(true)
    }
}

#Preview {
    SearchCollegeView()
}
