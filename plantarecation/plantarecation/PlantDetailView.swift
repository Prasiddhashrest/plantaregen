import SwiftUI

struct PlantDetailView: View {
    @State var plant: Plant

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(plant.name)
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(plant.careInstructions)
                .padding()

            Button(action: {
                waterPlant()
            }) {
                Text("Water Plant")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle(plant.name)
    }

    func waterPlant() {
        plant.lastWateredDate = Date()
        NotificationManager.shared.scheduleWateringNotification(for: plant)
    }
}

struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let samplePlant = Plant(name: "Fiddle Leaf Fig", careInstructions: "Water weekly, provide bright indirect light.", wateringInterval: 7 * 24 * 60 * 60, sunlightRequirement: "High")
        PlantDetailView(plant: samplePlant)
    }
}

