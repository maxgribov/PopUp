# PopUp
SwiftUI simple pop up view implementation:
 
<img src="img/example.gif" alt="drawing" width="300"/>

## Installing
PopUp Library can be installed using Swift Package Manager.

Use the package URL to search for the PopUp package: [https://github.com/maxgribov/PopUp](https://github.com/maxgribov/PopUp)

For how-to integrate package dependencies refer to [Adding Package Dependencies to Your App documentation.](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app)

## Usage

### Show

You can easily present a pop up with `View` modifier `popUp`. This is very similar how to present a sheet:

 ```swift
 struct CustomAlertModel: Identifiable {
     var id: UUID = UUID()
     let title: String
     let message: String
 }

 struct ContentView: View {
     @State var customAlert: CustomAlertModel?
     var body: some View {
         
         Button("Show custom alert") {
             customAlert = CustomAlertModel(
                 title: "Pop Up",
                 message: "Some message here..."
             )
         }
         .popUp(item: $customAlert) { viewModel in
             CustomAlert(viewModel: viewModel)
         }
     }
 }

 struct CustomAlert: View {
     let viewModel: CustomAlertModel
     var body: some View {
         VStack {
             Text(viewModel.title)
                 .font(.title)
             Text(viewModel.message)
         }
         .padding(40)
         .background(
             RoundedRectangle(cornerRadius: 30)
                 .foregroundStyle(.white)
         )
     }
 }
 ```
### Customise

There are few methods that you can use to customise look and behaviour of the pop up:
- `popUpBackgroundMaterial`: updates material for the dim view under the pop up view.
- `popUpPresentAnimation`: replaces the animation for the pop up show up.
- `popUpDismissAnimation`: replaces the animation for the pop up dismiss.
- `popUpDismissOnBackgroundTap`: enables or disables the pop up dismissal on user tap at the dim view outside of the pop up view.

#### Example:
 ```swift
 struct ContentView: View {
     @State var customAlert: CustomAlertModel?
     var body: some View {
         
         Group {
             // ...
         }
         .popUp(item: $customAlert) { viewModel in
             CustomAlert(viewModel: viewModel)
         }
         .popUpBackgroundMaterial(.ultraThin)
     }
 }
 ```

## System Requirements

**Swift 5.9**
* iOS 15+
* macOS 12+

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
