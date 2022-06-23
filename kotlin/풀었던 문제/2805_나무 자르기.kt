lateinit var trees: Array<Long>

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    var low: Long
    var cutter: Long = 0
    var high: Long
    var logSize: Long
    var result: Int

    val (N, M) = br.readLine().split(" ").map { it.toInt() }
    trees = br.readLine().split(" ").map { it.toLong() }.toTypedArray().sortedArray()

    low = 0
    high = trees.last()

    while (low < high) {
        cutter = (low + high) / 2
        logSize = 0

        for (i in trees) {
            if (i <= cutter)
                continue
            logSize += i - cutter
        }

        if (logSize < M.toLong())
            high = cutter
        else
            low = cutter + 1
    }

    bw.append("${low - 1}")
    bw.flush()
    bw.close()
}