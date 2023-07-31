import kotlin.math.max
import kotlin.math.min

lateinit var ground: Array<Array<Int>>

data class Result(var time: Int, var target: Int)

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()
    var target: Int
    var block: Int
    var time: Int
    var temp: Int
    var minimum = 256
    var maximum = 0
    var result = Result(Int.MAX_VALUE, -1)


    val (N, M, B) = br.readLine().split(" ").map { it.toInt() }
    ground = Array(N) { Array(M) { 0 } }
    for (i in ground.indices) {
        ground[i] = br.readLine().split(" ").map { it.toInt() }.toTypedArray()
        minimum = min(minimum, ground[i].minOrNull()!!)
        maximum = max(maximum, ground[i].maxOrNull()!!)
    }


    for (target in minimum..maximum) {
        time = 0
        block = B

        loop@ for (i in ground.indices) {
            for (j in ground[i].indices) {
                if (ground[i][j] > target) {
                    time += (ground[i][j] - target) * 2
                    block += ground[i][j] - target

                } else if (ground[i][j] < target) {
                    time += target - ground[i][j]
                    block -= target - ground[i][j]
                }
            }
        }

        if (block >= 0 && time <= result.time && target >= result.target) {
            result.time = time
            result.target = target
        }
    }
    bw.append("${result.time} ${result.target}")
    bw.flush()
    bw.close()
}