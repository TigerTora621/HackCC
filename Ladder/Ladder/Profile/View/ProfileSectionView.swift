//
//  ProfileSectionView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//



import SwiftUI

struct ProfileSectionView: View {
    let user: User
    
    var body: some View {
        VStack {
            DividerView()
                .padding(.top,40)
            HeadlineView(user: user)
                .frame(maxWidth: .infinity)
            
            DividerView()
            SkillView(user: user)
                .frame(maxWidth: .infinity)
            
            DividerView()
            LanguageView(user: user)
                .frame(maxWidth: .infinity)
            
            DividerView()
            PassionView(user: user)
                .frame(maxWidth: .infinity)
            
            DividerView()
            EducationView(user: user)
                .frame(maxWidth: .infinity)
            
            DividerView()
            ExperienceView(user: user)
                .frame(maxWidth: .infinity)
            
            DividerView()
            CommunityView(user: user)
                .frame(maxWidth: .infinity)
            
            DividerView()
            ProjectView(user: user)
                .frame(maxWidth: .infinity)
            
            DividerView()
            HonorAwardView(user: user)
                .frame(maxWidth: .infinity)
            
            DividerView()
        }
    }
}

