//
//  VehicleListView.swift
//  Rides
//
//  Created by Sneha Kalariya on 2023-09-17.
//

import SwiftUI

struct VehicleListView: View {
    @EnvironmentObject var viewModel : VehicleListViewModel
    @State private var vehicleNumber : String = ""
    
    var body: some View {
        let cellList = viewModel.vehicleList
        NavigationStack{
            VStack{
                HStack{
                    TextField("How many cars?", text: $vehicleNumber)
                        .keyboardType(.numberPad)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                
                    Button("Show") {
                        self.submitAction(num: self.vehicleNumber)
                    }
                    .buttonStyle(.bordered)
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text(RidesConstant.alertMsg), dismissButton: .default(Text("Got it!")))
                           }
                }
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                if cellList.count != 0{
                    HStack {
                        Text("Sorted by:")
                            .font(Font.headline)
                        RadioButtonView { selected in
                            self.viewModel.handleSorting(selected)
                        }
                    }.padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 60))
                }
                ZStack{
                    VStack(spacing:0) {
                        if self.viewModel.showErrorMsg {
                            Text(RidesConstant.apiErrorMsg)
                                .foregroundColor(.black.opacity(0.4))
                        }
                        if cellList.count != 0{
                            TableHeader()
                                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 20))
                                .background(.black.opacity(0.4))
                        }
                        
                        List(cellList, id: \.id) { list in
                            NavigationLink(destination: VehicleDetailView(vehicleList: .constant(list)).environmentObject(VehicleDetailViewModel())) {
                                VehicleListCell(cellItem: list)
                                    .frame(height: 50)
                            }
                            .buttonStyle(.plain)
                        }
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listStyle(.plain)
                    }
                    if self.viewModel.showIndicator{
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                            .scaleEffect(2)
                            .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .center)
                            .background(.black.opacity(0.0))
                    }
                }
            }
            .navigationTitle("Cars")
            .onAppear(perform: {
                self.viewModel.showIndicator = false
            })
        }
    }
    public func submitAction(num:String){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)

        self.viewModel.vehicleList.removeAll()
        self.viewModel.showIndicator = true
        self.viewModel.getVehicleList(numOfVehicle: num)
    }
}
struct VehicleListView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView()
    }
}

