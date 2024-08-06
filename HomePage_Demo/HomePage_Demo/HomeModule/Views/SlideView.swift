//
//
import SwiftUI
struct SlideView: View {
   
    var selectedItem: SILayoutBuilderDataAssetMap?

    var body: some View {
        VStack {
            ZStack {
                Image("BoardMembers")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 325, height: 325)
                Image("Overlay")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 325, height: 325)
                
                VStack(alignment: .center) {
                    Spacer()
                    Text("News")
                        .foregroundColor(Color(AppColorName.orange_F18700.rawValue))
                        .font(.custom(UIFont.CustomFont.hindBold.rawValue, size: 12))
                        .frame(width: 33, height: 12)
                }
                .padding(.bottom, 10)
            }
            .padding(.zero)
            
            Text("LSG add six players at the auction to bolster the squad ahead of IPL 2024")
                .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
                .font(.custom(UIFont.CustomFont.hindBold.rawValue, size: 20))
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
                .frame(width: 295, height: 63)
        }
        .frame(width: 325, height: 390)
        .background(Color(AppColorName.black_1A1A1A.rawValue))
    }
}
#Preview {
    SlideView()
}
struct Slide: Identifiable {
    let id = UUID()
    let imageName: String
    let overlayName: String
    let newsTitle: String
    let newsDescription: String
}
//import SwiftUI
//
//struct SlideView: View {
//    let widget: CustomHomeWidget
//
//    var body: some View {
//        VStack {
//            ZStack {
//                Image("BoardMembers")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 325, height: 325)
//                Image("Overlay")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 325, height: 325)
//                
//                VStack(alignment: .center) {
//                    Spacer()
//                    Text("News")
//                        .foregroundColor(Color(AppColorName.orange_F18700.rawValue))
//                        .font(.custom(UIFont.CustomFont.hindBold.rawValue, size: 12))
//                        .frame(width: 33, height: 12)
//                }
//                .padding(.bottom, 10)
//            }
//            .padding(.zero)
//            
//            Text(widget.homeLayout?.widgetData?.data?.assetMap?.first?.assetMeta?.title ?? "")
//                .foregroundColor(Color(AppColorName.white_FFFFFF.rawValue))
//                .font(.custom(UIFont.CustomFont.hindBold.rawValue, size: 20))
//                .padding(.horizontal, 15)
//                .padding(.bottom, 10)
//                .frame(width: 295, height: 63)
//        }
//        .frame(width: 325, height: 390)
//        .background(Color(AppColorName.black_1A1A1A.rawValue))
//       
//    }
//}
