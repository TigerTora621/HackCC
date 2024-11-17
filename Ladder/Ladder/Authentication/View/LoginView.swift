//
//  LoginView.swift
//  Ladder
//
//  Created by Toranosuke Ugajin on 11/16/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var width = UIScreen.main.bounds.width
    @State var goRegiView = false
    @State private var isLoading = false
    @StateObject var viewModel: LoginViewModel
    
    @ObservedObject var authManager: AuthManager
    @ObservedObject var userManager: UserManager
    
    init(authManager: AuthManager, userManager: UserManager) {
        self.authManager = authManager
        self.userManager = userManager
        
        let viewModel = LoginViewModel(authManager: authManager)
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack {
            Color(.white).ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center) {

                    
                    AppIconImageView()
                    
                }
                .padding(.bottom,30)
                
                TextField("Enter your email", text: $viewModel.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .modifier(StandardTextFieldModifier())
                    .padding(.bottom, 4)
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(StandardTextFieldModifier())
                
                HStack{
                    Spacer()
                    Button{
                        
                    } label: {
                        Text("Forgot password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .foregroundStyle(Color(.systemIndigo))
                            .padding(.trailing, 28)
                        
                    }
                }
                
                Button {
                    onLogin()
                } label: {
                    Text("Sign in")
                        .modifier(StandardButtonModifier())
                }
                .padding(.top)
                
                Spacer()
                
                HStack(alignment: .center) {
                    Button{
                        withAnimation(.easeInOut(duration: 0.5)){
                            goRegiView = true
                        }
                    } label: {
                        HStack {
                            Text("Don't have an account?")
                                .foregroundColor(Color(.systemIndigo))
                            Text("Sign Up")
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemIndigo))
                        }
                    }
                    .padding(.bottom, 10)
                }
            }
            
            if goRegiView {
                RegisterView(authManager: authManager)
                    .transition(.move(edge: .trailing))
            }
        }
        
        
    }
}
private extension LoginView {
    
    func onLogin() {
        Task { await viewModel.signIn() }
    }
}

#Preview {
    LoginView(authManager: AuthManager(service: AuthService()), userManager: UserManager(service: UserService()))
}

