//
//  HomeViewModel.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 05/08/24.
//

import Foundation
class CustomHomeWidget {
    var widgetType: LSGHomePageLayoutWidgetsEnum?
    var homeLayout: SILayoutBuilderWidget?
    var isLoaded: Bool?
    var isLoadingData: Bool?
    var itemHeight: CGFloat?
    var itemRatio:  CGFloat?
}
final class  HomeViewModel: ObservableObject {
    
    var actualHomeLayouts: [SILayoutBuilderWidget] = []
    var customHomeWidgets: [CustomHomeWidget] = []
    
    func getLayoutBuilderData(completion: @escaping(_ success: Bool) -> Void) {
        let homeUrl = (CommonUtilities.shared.getBaseApiUrl() + (FirebaseModelConfig.sharedFirebaseConfig.homePath ?? .blank))
        
        SIFeedsServiceInteractor.shared.getLayoutBuilderData(
            urlString: homeUrl) { response, _, error in
                if let response = response {
                    let widgets = response.content?.module?.filter({$0.componentID ?? -1 != SIFeedsComponentType.unknown.rawValue})
                    self.actualHomeLayouts = widgets?.sorted(by: {($0.metaInfo?.widgetOrder ?? 0) < ($1.metaInfo?.widgetOrder ?? 0)}) ?? []
                    
//                    self.fanPollEntityMapId = widgets?.first(where: { SILayoutBuilderWidget in
//                        SILayoutBuilderWidget.title == "Poll"
//                    })?.metaInfo?.entityRoleMapId?.description
                    
//                    self.setupHomeWidgets()
                    completion(true)
                     print("Widget Builder Response: \(response)")
                } else {
                    debugPrint("Widget Bilder Error: \(String(describing: error))")
                    completion(false)
                }
            }
    }
    
    
}
