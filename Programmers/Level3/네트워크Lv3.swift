import Foundation

func dfs(visited: inout [Int], adList: [[Int]], index: Int, size: Int) {
    visited[index] = -1
  
  for i in 0..<size {
    let target = adList[index][i]
    if visited[i] == 0 && target == 1 {
      dfs(visited: &visited, adList: adList, index: i, size: size)
    }
  }
}

func solution네트워크(_ n:Int, _ computers:[[Int]]) -> Int {
  var visited = Array(repeating: 0, count: n)
  var result = 0
  
  for i in 0..<n {
    if visited[i] == 0 {
      result += 1
      dfs(visited: &visited, adList: computers, index: i, size: n)
    }
  }
  
  return result
}

//solution(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])
