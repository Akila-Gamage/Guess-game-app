//
//  GameView.swift
//  Mock 3
//
//  Created by Akila Gamage on 2024-11-26.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel : ViewModel = ViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Text("Guess the answer!")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(Color(viewModel.selectedColor))
                    .padding(.bottom, 10)
                Text("What is \(viewModel.randomNumber1) \(viewModel.randomOperator) \(viewModel.randomNumber2)?")
                    .font(.system(size: 23 , weight: .bold))
                HStack {
                    TextField("Answer", text:$viewModel.submittedAnswer)
                    Button("Submit"){
                        viewModel.isSubmitted = true
                        viewModel.CheckAnswer()
                    }.disabled(viewModel.isSubmitted)
                    .buttonStyle(.bordered)
                    .tint(.blue)
                }.padding()
                    .border(.black, width: 1)
                if(viewModel.isSubmitted){
                    if(viewModel.isCorrect){
                        HStack {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(Color.green)
                            Text("CORRECT ANSWER! WELL DONE!")
                                .foregroundStyle(Color.green)
                        }
                    }
                    if(!viewModel.isCorrect){
                        HStack {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundStyle(Color.red)
                            Text("Incorrect Answer! The actual answrer is \(viewModel.correctAnswer)")
                                .foregroundStyle(Color.red)
                        }
                    }
                }
                Text("\(viewModel.score)")
                    .font(.system(size: 80, weight: .bold))
                    .padding(30)
                Text("Instructions:")
                    .font(.system(size: viewModel.fontSize))
                    .padding()
                Text("Submit the correct answer and gain 1 point. Submit the wrong answer or press on 'NEXT' and lose 1 point.")
                    .multilineTextAlignment(.center)
                    .font(.system(size: viewModel.fontSize))
                Button("NEXT"){
                    viewModel.onClickNext()
                }
                .buttonStyle(.bordered)
                .tint(.green)
            }.padding()
        }.onAppear(){
            viewModel.RandomNumberGenerator()
            viewModel.RandomOperatorGenerator()
        }
    }
    
}

//#Preview {
//    GameView(fontSize: .constant(16.00))
//}
