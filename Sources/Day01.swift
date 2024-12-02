import Algorithms

struct Day01: AdventDay {
  // Save your data in a corresponding text file in the `Data` directory.
  var data: String

  // Splits input data into its component parts and convert from string.
  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: "   ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Any {
	let col1 = entities.map{ $0[0] }
	let s1 = col1.sorted()
	let col2 = entities.map{ $0[1] }
	let s2 = col2.sorted()
	
	let diff = zip(s1, s2).map{ abs($0.0 - $0.1) }
	return diff.reduce(0, +)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Any {
	let col1 = entities.map{ $0[0] }
	let col2 = entities.map{ $0[1] }
	
	let countLookup = col2.reduce(into: [:]) { counts, number in
	    counts[number, default: 0] += 1
	}
	
	let result = col1.reduce(0) {
		$0 + ($1 * (countLookup[$1] ?? 0))
	}
	
	return result
  }
}
