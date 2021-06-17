import Foundation

extension Array where Element == Int {
  public mutating func radixSort() {
    let base = 10
    
    var done = false
    var digits = 1
    
    while !done {
      done = true
      
      var buckets: [[Int]] = .init(repeating: [], count: base)
      
      forEach { number in
        
        print("number", number, " digits", digits)
        // 숫자를 현재 비교하는 자릿수로 나눈 몫 e.g. number가 410이고 digits이 1이면 410
        let remainingPart = number / digits
        print("remainingPart", remainingPart)
        
        // digit = 비교 중인 자릿수에 해당하는 숫자.
        // e.g. number가 410일 때 base인 10으로 나누면 나머지가 0
        // 나머지 0이 410에서 현재 비교중인 1의 자릿수에 해당하는 수.
        let digit = remainingPart % base
        print("digit", digit)
        
        // 1의 자릿수 버킷들 중 digit(0)번 인덱스에 해당하는 버킷에 number인 410을 삽입.
        buckets[digit].append(number)
        print("buckets[digit].append ", number)
        
        // 만약 정렬해야하는 자릿수가 더 남아있다면 종료 플래그를 false로 하여 자릿수를 높여 비교를 계속함.
        // number가 1000의 자릿수가 가장 큰데 digits 10000으로 나누면 몫이 0임. 이때는 모든 자릿수의 숫자에 대해 비교가 끝났다고 판단하여 종료.
        if remainingPart > 0 {
          done = false
          print("remainingPart > 0")
        }
      }
      
      // 한 자릿수 비교가 모두 끝났으면 digits에 base를 곱해 비교할 자릿수를 한 단계 올림.
      digits *= base
      print("digits *= base", digits)
      // 2차원 배열을 1차원 배열로 평면화. (일부 정렬된 배열)
      // 그 다음 while문의 처음으로 돌아가서 다음 자릿수에 대해 비교를 시작함.
      self = buckets.flatMap({ $0 })
      print("self = buckets.flatMap({ $0 })", self)
    }
  }
}
