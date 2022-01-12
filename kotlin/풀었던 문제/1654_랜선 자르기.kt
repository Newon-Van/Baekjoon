//import kotlin.time.ExperimentalTime
//import kotlin.time.TimeSource
//
//lateinit var lanCable: Array<Int>
//
//fun slice(targetLanO: Int, minimumLanO: Int): Int {
//    var targetLan = targetLanO
//    var minimumLan = minimumLanO
//
//    var count = 0
//
//    while (targetLan > minimumLan) {
//        targetLan -= minimumLan
//        count++
//    }
//
//    return count
//}
//
//fun solve(K: Int, N: Int): Int {
//    var minimumLan = lanCable[0]
//    var count = 0
//
//    if (K == N)
//        return minimumLan
//
//    while (minimumLan > 0) {
//        for (i in lanCable.indices)
//            count += slice(lanCable[i], minimumLan)
//
//        if (count == N)
//            break
//
//        minimumLan--
//        count = 0
//    }
//
//    return minimumLan
//}
//
//fun main() {
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (K, N) = br.readLine().split(" ").map { it.toInt() }
//    lanCable = Array(K) { 0 }
//    for (i in lanCable.indices)
//        lanCable[i] = br.readLine().toInt()
//
//    lanCable.sort()
//
//    bw.append("${solve(K, N)}")
//    bw.flush()
//    bw.close()
//}