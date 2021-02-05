import RxSwift

//Filter

// 뭐 그냥 꽤 직관적임

let disposeBag = DisposeBag()
let numbers = [1,2,3,4,5,6,7,8,9,10]


Observable.from(numbers)
    .filter {$0 % 2 == 0}
    .subscribe {print($0)}
    .disposed(by: disposeBag)

