////
////  FixturesViewModel.swift
////  HomePage_Demo
////
////  Created by Jaideep Singh on 06/08/24.
////
//
//import Foundation
//import UIKit
//
//final class FixturesVM : ObservableObject {
//    
//    //MARK: Variables
//    var scoreStripModel:ScoreStripModel?
//    var isMatchLive: Bool = false
//    var tableViewHeight: Int = 0
//    var nextUpcomingMatchDate: String?
//    var liveMatchData: [Match]?
//    var allMatches : [Match]?
//    var commonContentMatches : CommonContentMatchesModel?
//    
//    var selectedFilters: [FilterValue]?
//}
//    
////MARK: Service Calls
//    
//extension FixturesVM {
//    fileprivate func configureScoreStripData(_ modelData: ScoreStripModel?){
//        isMatchLive = false
//        //        self.todaymatches = nil
//        guard let matchData = modelData else { return }
//        
//        if (selectedFilters?[0].entities != "" && selectedFilters?[0].entities != nil) {
//            let selectedClubMatchData = matchData.matches?.filter({ $0.participants?.first?.id == selectedFilters?[0].entities || $0.participants?[1].id == selectedFilters?[0].entities })
//            allMatches = selectedClubMatchData
//        }else{
//            allMatches = matchData.matches
//            //            ?.sorted(by: { Match1, Match2 in
//            //                Match1.startDate ?? .blank < Match2.startDate ?? .blank
//            //            })
//        }
//        
//        liveMatchData = matchData.matches?.filter({ $0.eventState == .live })
//        
//        nextUpcomingMatchDate = allMatches?.filter({$0.eventState == Lucknow_Super_Giants.MatchState.upcoming}).sorted(by: {$0.startDate ?? .blank < $1.startDate ?? .blank}).first?.startDate
//        
//        if liveMatchData?.count == 0 {
//            isMatchLive = false
//        }else{
//            isMatchLive = true
//        }
//        
//    }
//    fileprivate func scoreStripModelData(_ data: [Match]?) {
//        var matchData = data
//        matchData = matchData?.sorted(by: { $0.startDate?.convertToDate()?.compare($1.startDate?.convertToDate() ?? Date()) == .orderedAscending })
//        self.scoreStripModel?.matches = matchData
//    }
//    
//    fileprivate func configureLiveStatus(_ modelData: ScoreStripModel?){
//        isMatchLive = false
//        
//        guard let matchData = modelData else { return }
//        liveMatchData = matchData.matches?.filter({ $0.eventState == .live })
//        if liveMatchData?.count == 0 {
//            isMatchLive = false
//        }else{
//            isMatchLive = true
//        }
//    }
//}
