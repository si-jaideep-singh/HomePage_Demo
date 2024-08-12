//
//  QuizServiceManager.swift
//  HomePage_Demo
//
//  Created by Jaideep Singh on 08/08/24.
//


import Foundation

final class QuizServiceManager {
    static let shared = QuizServiceManager()
    
    func getQuizData(index: Int = 0, response: QuizSubmitResponse? = nil, isFirstLoad: Bool = true, entityMapId: String?, completion:@escaping(Result<[QuizContentDataDetail], NetworkErrors>) -> Void) {
        
        let url = (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank) + (FirebaseModelConfig.sharedFirebaseConfig.getPollListingApi ?? .blank)
            .replacingOccurrences(of: SIParameterKeys.pollEntity.name, with: (entityMapId ?? .blank))
            .replacingOccurrences(of: SIParameterKeys.user_guid.name, with: UserDefaultsManager.shared.getUserGuid() ?? .blank)
        
                NetworkManager.shared.makeRequest(url: url,
                                                            type: Quiz.self,
                                                            headerType: .authenticationWithUserToken,
                                                            completion: { response in
                    switch response {
                    case .success(let returnedResponse):
                        let quizData = returnedResponse.content?.quizContentData ?? []
                        DispatchQueue.main.async {
//                            GifyGifHud.dismiss()
                        }
                        completion(.success(quizData))
                    case .failure(let error):
                        DispatchQueue.main.async {
//                            KKRToastView.showToast(withMessage: error.description)
//                            GifyGifHud.dismiss()
                        }
                        completion(.failure(error))
                    }
                })
    }
    
    func submitPoll(parameter: QuizSubmitRequestParams,
                    delegate: QuizUpdateDelegate?,
                    currentIndex: Int,
                    completion: @escaping(Handler)) {
        
        let url =  (FirebaseModelConfig.sharedFirebaseConfig.baseUrl ?? .blank) + (FirebaseModelConfig.sharedFirebaseConfig.submitPollUrl ?? .blank)
        
        NetworkManager.shared.makePostRequest(url: url,
                                              type: QuizSubmitResponse.self,
                                              headerType: .authenticationWithUserToken,
                                              parameters: parameter) {[weak self] result in
            
            guard let self = self else {return}
            switch result {
            case .success(let response):
                let statusCode = response.status ?? 0
                if statusCode == 200 {
                    if let delegate = delegate {
                        delegate.reloadQuizData(index: currentIndex, response: response)
                    }
                    completion(true, "Submitted", nil, NetworkErrors.none)
                } else {
                    completion(false, "Failed", nil, .dataFailure)
                }
            case .failure(let error):
                completion(false, nil, nil, error)
//                DispatchQueue.main.async {
//                    KKRToastView.showToast(withMessage: error.description)
//                }
            }
        }
    }
}

