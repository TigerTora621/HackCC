//
//  RegisterView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//



import SwiftUI


struct RegisterView: View {
    
    @EnvironmentObject var userManager: UserManager
    @State var width = UIScreen.main.bounds.width
    @State var goLog = false
    @StateObject var viewModel: RegistrationViewModel
    @ObservedObject var authManager: AuthManager
    
    init(authManager: AuthManager) {
        self.authManager = authManager
        
        let vm = RegistrationViewModel(authManager: authManager)
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack{
                
                VStack(alignment: .center) {

                    
                    AppIconImageView()
                    
                }
                .padding(.bottom,15)
                
                TextField("Enter your fullname", text: $viewModel.fullname)
                    .modifier(StandardTextFieldModifier())
                    .padding(.bottom, 4)
                
                TextField("Enter your username", text: $viewModel.username)
                    .modifier(StandardTextFieldModifier())
                    .padding(.bottom, 4)
                
                TextField("Enter your email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .modifier(StandardTextFieldModifier())
                    .padding(.bottom, 4)
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(StandardTextFieldModifier())
                
                
                
                Button {
                    onSignUpTap()
                } label: {
                    Text("Sign up")
                        .modifier(StandardButtonModifier())
                    
                }
                .padding(.top,20)
                
                Spacer()
                
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)){
                        goLog = true
                    }
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .foregroundColor(Color(.systemIndigo))
                        
                        Text("Sign In")
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemIndigo))
                    }
                }
            }
            
            if goLog {
                LoginView(authManager: authManager, userManager: UserManager(service: UserService()))
                    .transition(.move(edge: .leading))
            }
        }
        
        
        
    }
}

private extension RegisterView {
    func onSignUpTap() {
        Task {
            guard let uid = await viewModel.createUser() else { return }
            try await userManager.uploadUserData(
                uid: uid,
                username: viewModel.username,
                email: viewModel.email,
                fullname: viewModel.fullname
            )
        }
    }
}

#Preview {
    RegisterView(authManager: AuthManager(service: AuthService()))
}

