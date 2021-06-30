import Foundation

func convert(_ numbers: [Int]) -> [[Int]] {
  var result: [[Int]] = []
  
  for i in numbers {
    switch i {
    case 1:
      result.append([0, 0])
    case 2:
      result.append([0, 1])
    case 3:
      result.append([0, 2])
    case 4:
      result.append([1, 0])
    case 5:
      result.append([1, 1])
    case 6:
      result.append([1, 2])
    case 7:
      result.append([2, 0])
    case 8:
      result.append([2, 1])
    case 9:
      result.append([2, 2])
    case 0:
      result.append([3, 1])
    default:
      break
    }
  }
  
  return result
}

func solution키패드누르기(_ numbers:[Int], _ hand:String) -> String {
  
  let keyPad = [[0, 0], [0, 1], [0, 2],
                [1, 0], [1, 1], [1, 2],
                [2, 0], [2, 1], [2, 2],
                [3, 0], [3, 1], [3, 2]]
  var rightH = [3, 2]
  var leftH = [3, 0]
  var result = ""
  var input = convert(numbers)
  
  for i in input {
    switch i {
    case [0, 0], [1, 0], [2, 0]:
      leftH = i
      result += "L"
    case [0, 2], [1, 2], [2, 2]:
      rightH = i
      result += "R"
    case [0, 1], [1, 1], [2, 1], [3, 1]:
      let rDiff = abs(i[0] - rightH[0]) + abs(i[1] - rightH[1])
      let lDiff = abs(i[0] - leftH[0]) + abs(i[1] - leftH[1])
      if rDiff > lDiff {
        leftH = i
        result += "L"
      }
      if lDiff > rDiff {
        rightH = i
        result += "R"
      }
      if lDiff == rDiff {
        switch hand {
        case "right":
          rightH = i
          result += "R"
        default:
          leftH = i
          result += "L"
        }
      }
    default:
      break
    }
  }
  
  return result
}

//solution([1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5], "right")
