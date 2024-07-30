import SwiftUI

struct NewPlantView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var plants: [Plant]
    @State private var name: String = ""
    @State private var sunlightRequirement: String = "Medium"
    @State private var wateringInterval: TimeInterval = 7 * 24 * 60 * 60 // Default to weekly

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Plant Details")) {
                    TextField("Plant Name", text: $name)
                    
                    Picker("Sunlight Requirement", selection: $sunlightRequirement) {
                        Text("Low").tag("Low")
                        Text("Medium").tag("Medium")
                        Text("High").tag("High")
                    }
                }
                
                Section(header: Text("Watering Schedule")) {
                    Picker("Watering Interval", selection: $wateringInterval) {
                        Text("Daily").tag(1 * 24 * 60 * 60)
                        Text("Every 3 Days").tag(3 * 24 * 60 * 60)
                        Text("Weekly").tag(7 * 24 * 60 * 60)
                        Text("Biweekly").tag(14 * 24 * 60 * 60)
                    }
                }
            }
            .navigationBarTitle("Add New Plant", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                let newPlant = Plant(name: name, careInstructions: "Sunlight: \(sunlightRequirement), Water every \(Int(wateringInterval / (24 * 60 * 60))) days", wateringInterval: wateringInterval, lastWateredDate: nil, sunlightRequirement: sunlightRequirement)
                plants.append(newPlant)
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct NewPlantView_Previews: PreviewProvider {
    @State static var plants = [Plant]()
    static var previews: some View {
        NewPlantView(plants: $plants)
    }
}

