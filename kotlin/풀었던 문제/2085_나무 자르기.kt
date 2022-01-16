//fun binarySearch(trees:Array<Int>, target:Int):Boolean {
//    var cutter: Int
//    var woods = 0
//
//
//
//
//
//}
//
//fun main() {
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, M) = br.readLine().split(" ").map { it.toInt() }
//    val trees = br.readLine().split(" ").map { it.toInt() }.toTypedArray().sortedArray()
//
//
//
//    var low = 0
//    var mid: Int
//    var high = trees.lastIndex
//
//    while (low + 1 < high) {
//        mid = low + high / 2
//
//        if (binarySearch(trees, trees[mid]))
//            low = mid
//        else
//            high = mid
//    }
//
//}