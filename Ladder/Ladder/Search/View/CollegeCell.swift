//
//  CollegeCell.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/17/24.
//

import SwiftUI

struct CollegeCell: View {
    var college: SchoolSelectViewModel
    var collegeNumStudent: String = "5000" // 仮のデータを設定
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(college.schoolTitle)
                .fontWeight(.heavy)
                .foregroundStyle(.black)
            
            Text("\(collegeNumStudent) students")
                .fontWeight(.light)
                .foregroundStyle(.blue)
        }
    }
}

#Preview {
    CollegeCell(college: .cccc) // Orange Coast College のエントリとして表示
}

