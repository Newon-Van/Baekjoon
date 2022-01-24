import kotlin.time.ExperimentalTime
import kotlin.time.TimeSource

lateinit var lanCable: Array<Int>

fun solve(K: Int, N: Int): Int {
    var minimumLan = 0
    var maximumLan = lanCable[lanCable.lastIndex] + 1
    var mid: Int
    var count:Long = 0

    while (minimumLan < maximumLan){
        mid = (maximumLan + minimumLan) / 2

        for(i in lanCable.indices){
            count += (lanCable[i] / mid)
        }

        if (count < N)
            maximumLan = mid
        else
            minimumLan = mid + 1
    }

    return minimumLan
}

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (K, N) = br.readLine().split(" ").map { it.toInt() }
    lanCable = Array(K) { 0 }
    for (i in lanCable.indices)
        lanCable[i] = br.readLine().toInt()

    lanCable.sort()

    bw.append("${solve(K, N) - 1}")
    bw.flush()
    bw.close()
}