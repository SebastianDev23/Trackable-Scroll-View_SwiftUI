
//  Created by Sebastian Kl


import SwiftUI

struct ContentView: View {
    
    let background = LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
    @State private var contentOffset = CGFloat(0)
    
    var body: some View {
        NavigationView {
            
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: { offset in
                    contentOffset = offset.y
                    print("contentOffset", contentOffset)
                    
                }) {
                    Text("Scroll me!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                    
                        .opacity(contentOffset < -2 ? 0 : 1)
                        .animation(.easeIn, value: contentOffset)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(background)
            .navigationBarHidden(true)
            
        }
      //  .navigationViewStyle(StackNavigationViewStyle())
        .statusBar(hidden: true)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
