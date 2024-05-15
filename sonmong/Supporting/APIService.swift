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
    
    func loginPostRequest(name: String, number: String) {
        var components = URLComponents(string: "http://175.106.96.107:8080")
        components?.path = "/api/v1/auth/signin"
        // "175.106.96.107:8080/api/v1/auth/signin"
//        guard let url = URL(string: "http://175.106.96.107:8080/api/v1/auth/signin") else { return }
        guard let url = components?.url else { return }
        var request: URLRequest = URLRequest(url: url)
        
        request.httpMethod = "POST"
        //헤더 지정
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //타임아웃 시간 지정. (5초 이상 걸리면 중지)
        request.timeoutInterval = 5
        //Codable 모델 생성
        let bodyModel = User(userName: name, phoneNumber: number)
        print("jsonParameter = ", bodyModel)
        //Codable 모델을 JSON 인코딩하여 데이터로 만든 후 http 바디에 추가
        request.httpBody = try? JSONEncoder().encode(bodyModel)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data,
                  let str = String(data: data, encoding:.utf8) else { return }
            print(str)
        }
        
        task.resume()
    }
    
    func postRxRequest<T: Codable>(stringUrl: String, parameter: [String : Any], type: T.Type) -> Observable<T> {
        
        return Observable.create { observer in
            guard let jsonData = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {
                observer.onError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "JSON Serialization failed"]))
                return Disposables.create()
            }
            
            // URLRequest 구성
            guard let url = URL(string: stringUrl) else { return Disposables.create() }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            print("Request Parameter: ", parameter)
            
            // URLSession을 사용하여 HTTP 요청 전송
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    observer.onError(error)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    observer.onError(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "HTTP Error"]))
                    return
                }
                
                // JSON 응답을 T 타입으로 디코딩
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    print("DecodeData: \(decodedData)")
                    observer.onNext(decodedData)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            task.resume()
            
            // 작업을 취소할 수 있는 Disposable 반환
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func postRxSecureRequest<T: Codable>(stringUrl: String, parameter: [String : Any], type: T.Type) -> Observable<T> {
        
        return Observable.create { observer in
            guard let jsonData = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {
                observer.onError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "JSON Serialization failed"]))
                return Disposables.create()
            }
            
            // URLRequest 구성
            guard let url = URL(string: stringUrl) else { return Disposables.create() }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            // UserDefaults에서 토큰을 가져와서 헤더에 추가
            if let token = UserDefaults.standard.string(forKey: Constant.UDKey.accessToken) {
                request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                print("Request AccessToken: ", token)
            }
            
            print("Request Parameter: ", parameter)
            
            // URLSession을 사용하여 HTTP 요청 전송
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Request Error: ", error)
                    observer.onError(error)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                    observer.onError(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "HTTP Error"]))
                    return
                }
                
                // JSON 응답을 T 타입으로 디코딩
                guard let data = data else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                    return
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    print("DecodeData: \(decodedData)")
                    observer.onNext(decodedData)
                    observer.onCompleted()
                } catch {
                    observer.onError(error)
                }
            }
            task.resume()
            
            // 작업을 취소할 수 있는 Disposable 반환
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
