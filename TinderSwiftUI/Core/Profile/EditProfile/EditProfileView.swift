//
//  EditProfileView.swift
//  TinderSwiftUI
//
//  Created by HardiB.Salih on 6/13/24.
//

import SwiftUI

struct EditProfileView: View {
    @State var bio: String = ""
    @State var occupation: String = "Fighter"
    
    let user: User
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileImageGridView(user: user)
                
                VStack(spacing: 24){
                    VStack(alignment: .leading) {
                        Text("ABOUT ME")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        TextField("Add your bio", text: $bio, axis: .vertical)
                            .padding()
                            .frame(height: 64, alignment: .top)
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("OCCUPATION")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        HStack{
                            Image(systemName: "book")
                            Text("Occupation")
                            Spacer()
                            
                            Text(occupation)
                                .font(.footnote)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                    
                    
                    VStack(alignment: .leading) {
                        Text("GENDER")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        HStack{
                            Text("Man")
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("SEXUAL ORIENTATION")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)
                        
                        HStack{
                            Text("Straight")
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                }
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
 
        
    }
}

#Preview {
    EditProfileView(user: .placeholder(9))
}
