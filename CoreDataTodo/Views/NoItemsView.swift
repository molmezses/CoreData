//
//  NoItemsView.swift
//  CoreDataTodo
//
//  Created by Mustafa Ölmezses on 20.02.2025.
//

import SwiftUI

struct NoItemsView: View {

    @EnvironmentObject var viewModel: ListViewModel
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    
                    Text("There are no items!")
                        .font(.title)
                        .fontWeight(.semibold)
                    Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                        .padding(.bottom , 20)
                    NavigationLink {
                        AddView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Text("Add Something 🥳")
                            .foregroundStyle(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(viewModel.animate ? viewModel.secondaryAccentColor : .accentColor)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .padding(.horizontal , viewModel.animate ? 30 : 50)
                    .shadow(color: viewModel.animate ? viewModel.secondaryAccentColor.opacity(0.7) : .accentColor.opacity(0.7),
                            radius: viewModel.animate ? 30 : 10,
                            x: 0,
                            y: viewModel.animate ? 50 : 30)
                    .scaleEffect(viewModel.animate ? 1.1 : 1.0)
                    .offset(y: viewModel.animate ? -7 : 0)
                }
                .multilineTextAlignment(.center)
                .padding(40)
                .onAppear(perform:viewModel.addAnimation)
            }
            .frame(maxWidth: .infinity , maxHeight: .infinity)
        }
        .onAppear{
            viewModel.animate = true
        }
    }
}

#Preview {
    NavigationStack{
        NoItemsView()
            .navigationTitle("title")
            .environmentObject(ListViewModel())
    }
    
}
