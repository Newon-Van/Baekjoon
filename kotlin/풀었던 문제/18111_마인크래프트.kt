lateinit var ground: Array<Array<Int>>
var heightArray = Array(257) { -1 }

data class Result(var time: Int, var target: Int)

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()
    var target: Int
    var block: Int
    var time: Int
    var temp: Int
    var result = Result(Int.MAX_VALUE, -1)

    val (N, M, B) = br.readLine().split(" ").map { it.toInt() }
    ground = Array(N) { Array(M) { 0 } }
    for (i in ground.indices) {
        ground[i] = br.readLine().split(" ").map { it.toInt() }.toTypedArray()
        ground[i].groupingBy { it }.eachCount().map { heightArray[it.key] += it.value + 1 }
    }

    while (true) {
        time = 0
        block = B
        target = heightArray.indexOf(heightArray.maxOrNull())
        if (target == 0 && heightArray[0] == -1)
            break
        heightArray[heightArray.indexOf(heightArray.maxOrNull())] = -1

        loop@ for (i in ground.indices) {
            for (j in ground[i].indices) {
                if (ground[i][j] < target) {
                    block -= 1
                    time += 1

                    if (block < 0)
                        break@loop

                } else if (ground[i][j] > target) {
                    temp = ground[i][j]
                    while (temp != target) {
                        temp -= 1
                        block += 1
                        time += 2
                    }
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