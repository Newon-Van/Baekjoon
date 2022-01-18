import java.math.*

lateinit var mineMap: Array<Array<Int>>

fun mode(N: Int, M: Int) {
    var mode = 1
    var freq = 1
    var count = 1


    for (i in 0 until N) {
        for (j in 0 until M) {
            freq = 1
            for (k in j + 1 until M) {
                if (mineMap[i][j] == mineMap[i][k])
                    freq++
            }
            if (freq >= count) {
                mode = mineMap[i][j]
                count = freq
            }
        }
    }

    println("$mode, $freq")
}

fun solve(N: Int, M: Int, B: Int) {

}

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, M, B) = br.readLine().split(" ").map { it.toInt() }
    mineMap = Array(N) { Array(M) { 0 } }


    for (i in mineMap.indices) {
        mineMap[i] = br.readLine().split(" ").map { it.toInt() }.toTypedArray()
        for (j in 0 until M) {

        }
    }
}