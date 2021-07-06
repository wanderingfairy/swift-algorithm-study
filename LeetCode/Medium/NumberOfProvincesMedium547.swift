class Solution547 {
  func findCircleNum(_ isConnected: [[Int]]) -> Int {
    
    var visited: [Int] = []
    var provinces = 0
    
    for v in 0..<isConnected.count {
      var enqueued: Set<Int> = []
      
      func bfs(current: Int) {
        visited.append(current)
        
        for i in 0..<isConnected.count where i != current {
          if !enqueued.contains(i) && isConnected[current][i] == 1 {
            enqueued.insert(i)
            bfs(current: i)
          }
        }
      }
      
      if !visited.contains(v) {
        provinces += 1
        enqueued.insert(v)
        bfs(current: v)
      }
    }
    
    return provinces
  }
}

//Solution().findCircleNum([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]])
