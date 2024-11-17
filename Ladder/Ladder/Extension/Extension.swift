//
//  Extension.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//


import SwiftUI

extension View {
    
    //This is TextField mehods
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
    
    //This is for UX
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}


