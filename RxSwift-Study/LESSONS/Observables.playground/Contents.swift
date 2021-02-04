import UIKit
import RxSwift

//두개의 정수를 방출하고 종료하는 Observable

/*
 지금은 생성된 상태일 뿐 subscriber 에 subscribe 해야 두개의 정수가 방출 되고 이어서 completed event 가 전달 됨
 */

// 1
Observable<Int>.create() { (observer) -> Disposable in
    observer.on(.next(0))
    observer.onNext(1)
    
    observer.onCompleted()
    return Disposables.create()
    
}

// 2

Observable.from([0,1])
