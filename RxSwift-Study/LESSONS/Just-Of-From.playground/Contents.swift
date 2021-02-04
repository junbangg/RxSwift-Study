import UIKit
import RxSwift

let disposeBag = DisposeBag()
let element = "ㅗ"

//Just

//Just는 하나의 항목을 방출하는 Observable 를 생성함
// - Parameter 를 그대로 방출. 그러니까 이름이 Just, 그냥

Observable.just(element)
    .subscribe {event in print(event)}
    .disposed(by: disposeBag)

Observable.just([1,2,3,4])
    .subscribe {event in print(event)}
    .disposed(by: disposeBag)

// Of: 2개 이상의 요소를 방출해야될때 쓴다 (가변 파라미터)

let one = "1"
let two = "2"
let three = "3"

Observable.of(one, two, three)
    .subscribe {elements in print(elements)}
    .disposed(by: disposeBag)

// From: - 여러개를 하나씩 순서대로 방출 하고 싶을 때 사용

let friends = ["June", "Sean", "KGB", "Justin", "Bob", "Jeremy"]

Observable.from(friends)
    .subscribe{ element in print(element)}
    .disposed(by: disposeBag)
