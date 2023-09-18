//
//  RadioButtonView.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-17.
//

import SwiftUI

//MARK:- Group of Radio Buttons
enum SortingType: String {
    case Vin = "Vin"
    case carType = "Car type"
}

struct RadioButtonView: View {
    let callback: (String) -> ()
    
    @State var selectedId: String = SortingType.Vin.rawValue
    
    var body: some View {
        HStack(spacing: -100) {
            radioVinMajority
            radiocarTypeMajority
        }
    }
    
    var radioVinMajority: some View {
        RadioButtonField(
            id: SortingType.Vin.rawValue,
            label: SortingType.Vin.rawValue,
            isMarked: selectedId == SortingType.Vin.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    var radiocarTypeMajority: some View {
        RadioButtonField(
            id: SortingType.carType.rawValue,
            label: SortingType.carType.rawValue,
            isMarked: selectedId == SortingType.carType.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}

//MARK:- Single Radio Button Field
struct RadioButtonField: View {
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.black,
        textSize: CGFloat = 14,
        isMarked: Bool = true,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
                Text(label)
                    .font(Font.system(size: textSize))
                Spacer()
            }.foregroundColor(self.color)
        }
        .foregroundColor(Color.white)
    }
}
