import Foundation

func solutionBestAlbum(_ genres:[String], _ plays:[Int]) -> [Int] {
  if genres.count == 1 {
    return [0]
  }
  
  var genresDict: [String:Int] = [:]
  var onlyOneGenres: [String:Int] = [:]
  
  var songsArr: [(Int, Int)] = []
  plays.enumerated().forEach { (idx, elem) in
    songsArr.append((idx, elem))
  }
  
  zip(genres, plays).map {
    genresDict[$0.0] = (genresDict[$0.0] ?? 0) + $0.1
    onlyOneGenres[$0.0] = (onlyOneGenres[$0.0] ?? 0) + 1
  }
  
  let sortedGenres = genresDict.sorted(by: {$0.value > $1.value})
  sortedGenres.enumerated().forEach { (idx, arg1) in
    
    let (key, _) = arg1
    genresDict[key] = idx
  }
  
  var result: [Int] = []

  
  result = songsArr.sorted { lhs, rhs in
    if genresDict[genres[lhs.0]]! < genresDict[genres[rhs.0]]! {
      return true
    } else if genresDict[genres[lhs.0]]! == genresDict[genres[rhs.0]]! {
      if lhs.1 > rhs.1 {
        return true
      } else if lhs.1 == rhs.1 {
        return lhs.0 < rhs.0
      } else {
        return false
      }
    } else {
      return false
    }
  }.map { $0.0}
  
  var genresEachCount: [String:Int] = [:]
  var removed = [Int]()
  
  result.enumerated().forEach { (idx, elem) in
    if genresEachCount[genres[elem]] != nil && genresEachCount[genres[elem]] == 2 {
      removed.append(idx)
    } else {
      genresEachCount[genres[elem]] = (genresEachCount[genres[elem]] ?? 0) + 1
    }
  }
  
  removed.sorted(by: >).forEach {
    result.remove(at: $0)
  }
  
  let count = Set(genres).count + onlyOneGenres.filter { $0.value != 1 }.keys.count
  return result[0...count-1].map { $0 }
}

//solution(["A", "A", "B", "A", "B", "B"], [5, 5, 6, 5, 7, 7])
