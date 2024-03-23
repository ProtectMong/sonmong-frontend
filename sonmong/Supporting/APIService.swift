//
//  APIService.swift
//  sonmong
//
//  Created by 이은솔 on 3/23/24.
//

import Foundation
import RxSwift
import RxCocoa
import RxAlamofire
import Alamofire

class APIService {

    private let disposeBag = DisposeBag()
    
    private let decoder = JSONDecoder() // JSONDecoder 인스턴스를 생성합니다.

    func request<T: Codable>(url: String, parameters: [String: Any], type: T.Type, token: String) -> Observable<T> {
        let headers: HTTPHeaders = [
                    "Authorization": "Bearer \(token)",
                    "Accept": "application/json"
                ]
        
        return Observable.create { observer in
                    RxAlamofire
                        .request(.post, url, parameters: parameters, encoding: JSONEncoding.default, headers: headers)
                        .responseData()
                        .observe(on: MainScheduler.instance)
                        .subscribe(onNext: { response, data in
                            // HTTP 상태 코드를 확인합니다.
                            if response.statusCode == 200 {
                                do {
                                    // JSON 데이터를 `type` 파라미터로 전달받은 T 타입의 객체로 디코딩합니다.
                                    let decodedObject = try self.decoder.decode(T.self, from: data)
                                    // 성공적으로 디코딩된 객체를 Observer에 전달합니다.
                                    observer.onNext(decodedObject)
                                    observer.onCompleted()
                                } catch {
                                    // 디코딩 에러를 Observer에 전달합니다.
                                    observer.onError(error)
                                }
                            } else {
                                // HTTP 에러를 Observer에 전달합니다.
                                observer.onError(NSError(domain: "", code: response.statusCode, userInfo: nil))
                            }
                        }, onError: { error in
                            // 네트워크 요청 실패를 Observer에 전달합니다.
                            observer.onError(error)
                        })
                        .disposed(by: self.disposeBag)
                    
                    return Disposables.create()
                }
        }
}
