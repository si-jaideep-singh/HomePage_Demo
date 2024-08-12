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

enum LatestUpdatesContentType : String, CaseIterable {
  case news =  "News"
  case photos =  "Photos"
  case  videos = "Videos"
}



final class HomeVM : ObservableObject {
    var actualHomeLayouts: [SILayoutBuilderWidget] = []
    var customHomeWidgets: [CustomHomeWidget] = []
    var smallArticle1: SILayoutBuilderModuleMetaInfo?
    var smallArticle2: SILayoutBuilderWidgetDataItem?
    @Published var shortDesc: String?
    var LatestUpdateDataDictionary : [String : CustomHomeWidget] = [:]
    func getLayoutBuilderData(completion: @escaping(_ success: Bool) -> Void) {
        let homeUrl = "https://stg-sg.sportz.io/apiv4/gettemplatedata?url=app-home-new"
        
        SIFeedsServiceInteractor.shared.getLayoutBuilderData(
            urlString: homeUrl) { response, _, error in
                if let response = response {
                    let widgets = response.content?.module?.filter({$0.componentID ?? -1 != SIFeedsComponentType.unknown.rawValue})
                    self.actualHomeLayouts = widgets?.sorted(by: {($0.metaInfo?.widgetOrder ?? 0) < ($1.metaInfo?.widgetOrder ?? 0)}) ?? []
                    
//                    self.fanPollEntityMapId = widgets?.first(where: { SILayoutBuilderWidget in
//                        SILayoutBuilderWidget.title == "Poll"
//                    })?.metaInfo?.entityRoleMapId?.description
                    
                    self.setupHomeWidgets()
                    completion(true)
                     print("Widget Builder Response: \(response)")
                } else {
                    debugPrint("Widget Bilder Error: \(String(describing: error))")
                    completion(false)
                }
            }
    }
    
    
    
    
    fileprivate func setupHomeWidgets() {
        customHomeWidgets.removeAll()
        var f = 0
        for homeLayout in actualHomeLayouts {
            let widgetLayout = homeLayout.metaInfo?.view ?? .blank
            let customHomeWidget = CustomHomeWidget()
            customHomeWidget.homeLayout = homeLayout
            if customHomeWidget.homeLayout?.showInApp == 1 {
                print("homeLayout.metaInfo?.component = \(homeLayout.metaInfo?.component ?? SIFeedsComponentName.unknown)")
                switch homeLayout.metaInfo?.component ?? SIFeedsComponentName.unknown {
                case .si_showcase:
                    // Layout All Show Case Widgets
                    switch widgetLayout {
                    case Constants.HomePageLayoutWidgetLayoutType.showcasewidget:
                        customHomeWidget.widgetType = .app_showcase
                        customHomeWidget.homeLayout = homeLayout
                        customHomeWidget.itemHeight = 440 //300
                        customHomeWidget.isLoaded = false
                        customHomeWidget.isLoadingData = false
                        customHomeWidgets.append(customHomeWidget)
                    default:
                        continue
                    }
                
                    
                    
                case .si_scorestrip:
                    switch widgetLayout {
                    case Constants.HomePageLayoutWidgetLayoutType.matchMastHeadWidget:
                        customHomeWidget.widgetType = .scorestrip
                        customHomeWidget.homeLayout = homeLayout
                        customHomeWidget.itemHeight = 550
                        customHomeWidget.isLoaded = false
                        customHomeWidget.isLoadingData = false
                        customHomeWidgets.append(customHomeWidget)

                    default:
                        break
                    }
                case .si_fan_zone:
                          customHomeWidget.widgetType = .fanzone
                          customHomeWidget.homeLayout = homeLayout
                          customHomeWidget.itemHeight = 275
                          customHomeWidget.isLoaded = false
                          customHomeWidget.isLoadingData = false
                          customHomeWidgets.append(customHomeWidget)
                case .si_shop_banner:
                          customHomeWidget.widgetType = .shopBanner
                          customHomeWidget.homeLayout = homeLayout
                          customHomeWidget.itemHeight = 125
                          customHomeWidget.isLoaded = false
                          customHomeWidget.isLoadingData = false
                          customHomeWidgets.append(customHomeWidget)
                    
                case .si_standings:
                    switch widgetLayout {
                    case Constants.HomePageLayoutWidgetLayoutType.standingWidget:
                        customHomeWidget.widgetType = .standings
                        customHomeWidget.homeLayout = homeLayout
                        customHomeWidget.itemHeight = 0
                        customHomeWidget.isLoaded = false
                        customHomeWidget.isLoadingData = false
                        customHomeWidgets.append(customHomeWidget)

                    default:
                        break
                    }
                    
                    
                case .si_listing:
                    switch widgetLayout {

//                    case Constants.HomePageLayoutWidgetLayoutType.videosWidget:
//                        // Add Latest Videos Listing
//                        customHomeWidget.widgetType = .videos
//                        customHomeWidget.homeLayout = homeLayout
//                        customHomeWidget.itemHeight = 392
//                        customHomeWidget.isLoaded = false
//                        customHomeWidget.isLoadingData = false
//                        customHomeWidgets.append(customHomeWidget)
                        
                    case Constants.HomePageLayoutWidgetLayoutType.latestUpdatesWidget:
                        
                       
                        
                            // Add Latest Updates Listing
                        if f == 0{
                            customHomeWidget.widgetType = .latestUpdates
                            customHomeWidget.homeLayout = homeLayout
                            customHomeWidget.itemHeight = 890
                            customHomeWidget.isLoaded = false
                            customHomeWidget.isLoadingData = false
                            customHomeWidgets.append(customHomeWidget)
                            f = 1
                        }
                           
                        if  let newsType = LatestUpdatesContentType(rawValue: customHomeWidget.homeLayout?.metaInfo?.tabTitle ?? "") {
                              LatestUpdateDataDictionary[newsType.rawValue] = customHomeWidget
                        }
                        
                        print(LatestUpdateDataDictionary)
                          
                        
//                        } else {
//                            customHomeWidget.widgetType = .latestUpdates
//                            customHomeWidget.homeLayout = homeLayout
//                            customHomeWidget.itemHeight = 0
//                            customHomeWidget.isLoaded = false
//                            customHomeWidget.isLoadingData = false
//                            customHomeWidgets.append(customHomeWidget)
                       // }

//                    case Constants.HomePageLayoutWidgetLayoutType.latestPhotosWidget:
//                        // Add Latest Photos Listing
//                        customHomeWidget.widgetType = .photos
//                        customHomeWidget.homeLayout = homeLayout
//                        customHomeWidget.itemHeight = 376
//                        customHomeWidget.isLoaded = false
//                        customHomeWidget.isLoadingData = false
//                        customHomeWidgets.append(customHomeWidget)

                    default:
                        break
                    }

                case .si_ads:
                    switch widgetLayout {
                    case Constants.HomePageLayoutWidgetLayoutType.adsWidget:
                        customHomeWidget.widgetType = .shop
                        customHomeWidget.homeLayout = homeLayout
                        customHomeWidget.itemHeight = 135
                        customHomeWidget.isLoaded = false
                        customHomeWidget.isLoadingData = false
                        customHomeWidgets.append(customHomeWidget)

                    default:
                        break
                    }


//                case .si_form:
//                    customHomeWidget.widgetType = .contestForm
//                    customHomeWidget.homeLayout = homeLayout
//                    customHomeWidget.itemHeight = 450
//                    customHomeWidget.isLoaded = false
//                    customHomeWidget.isLoadingData = false
//                    if homeLayout.metaInfo?.luckyDrawCode != nil {
//                        customHomeWidgets.append(customHomeWidget)
//                    }

                case .si_squad:
                    customHomeWidget.widgetType = .squad
                    customHomeWidget.homeLayout = homeLayout
                    customHomeWidget.itemHeight = 455
                    customHomeWidget.isLoaded = false
                    customHomeWidget.isLoadingData = false
                    customHomeWidgets.append(customHomeWidget)
                    
                case .si_poll:
                    switch widgetLayout {
                    case Constants.HomePageLayoutWidgetLayoutType.fanPoll:
                        customHomeWidget.widgetType = .poll
                        customHomeWidget.homeLayout = homeLayout
                        customHomeWidget.itemHeight = 471
                        customHomeWidget.isLoaded = false
                        customHomeWidget.isLoadingData = false
                        customHomeWidgets.append(customHomeWidget)
                    default:
                        break
                    }
                    
                case .si_fan_zone:
                    customHomeWidget.widgetType = .fanzone
                    customHomeWidget.homeLayout = homeLayout
                    customHomeWidget.itemHeight = 471
                    customHomeWidget.isLoaded = false
                    customHomeWidget.isLoadingData = false
                    customHomeWidgets.append(customHomeWidget)
                    
                case .si_shop_banner:
                    customHomeWidget.widgetType = .shopBanner
                    customHomeWidget.homeLayout = homeLayout
                    customHomeWidget.itemHeight = 471
                    customHomeWidget.isLoaded = false
                    customHomeWidget.isLoadingData = false
                    customHomeWidgets.append(customHomeWidget)
                    

                default:
                    print("Some Unknown Component: \(homeLayout.metaInfo?.component ?? .unknown)")
                }
            }
        }
        print(customHomeWidgets)
    }


    
}
