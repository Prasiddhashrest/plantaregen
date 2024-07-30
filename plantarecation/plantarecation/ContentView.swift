import SwiftUI

struct ContentView: View {
    @State private var plants: [Plant] = samplePlants
    @State private var showingNewPlantView = false

    var body: some View {
        NavigationView {
            List {
                ForEach($plants) { $plant in
                    NavigationLink(destination: PlantDetailView(plant: plant)) {
                        Text(plant.name)
                    }
                }
            }
            .navigationTitle("My Plants")
            .navigationBarItems(trailing: Button(action: {
                showingNewPlantView = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingNewPlantView) {
            NewPlantView(plants: $plants)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

