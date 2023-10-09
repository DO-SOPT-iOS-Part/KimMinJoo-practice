//
//  ViewModel.swift
//  Sopt-Seminar
//
//  Created by Minjoo Kim on 10/9/23.
//

import RxSwift
import RxRelay

class LoginViewModel {
    let emailObserver = BehaviorRelay<String>(value: "")
    let passwordObserver = BehaviorRelay<String>(value: "")

    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailObserver, passwordObserver)
            .map { email, password in
                return !email.isEmpty && email.isValidEmail() && !password.isEmpty
            }
    }
}

