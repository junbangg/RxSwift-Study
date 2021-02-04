import UIKit
import RxSwift


let disposeBag = DisposeBag()

enum MyError : Error {
    case error
}

// PublishSubject 는 Observable 인 동시에 Observer 이다
// 전달 받고 보내는거 둘다 가능

let subject = PublishSubject<String>()
subject.onNext("hello")

let o1 = subject.subscribe {print(">>1", $0)}
o1.disposed(by: disposeBag)

//이러면 subject.onnext 가 전달이 안됨..왜냐하면 구독이 이루어지기 전에 전달됨(onnext 를 통해)

subject.onNext("RxSwift")
//이러면 "RxSwift" 가 담긴 next event 가 subject 로 전달되고, subject는 이 event를 구독자에게 전달
let o2 = subject.subscribe {print(">>2", $0)}
o2.disposed(by: disposeBag)
// 지금까지 전달된건 마찬가지로 X

subject.onNext("Subject")
//여기서 또 전달하면 o1, o2 에게 모두 전달됨

//subject.onCompleted()
subject.onError(MyError.error)
// 시마이

let o3 = subject.subscribe { print(">>3", $0)}
o3.disposed(by: disposeBag)
//o3 도 completed 라고 됨
//error 전달하는것도 마찬가지임

// *Event 가 사라지는 것이 문제가 된다면  Replace Subject, Hold Observer를 사용해야함 
