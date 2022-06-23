lateinit var SanggunCard: List<Int>
lateinit var RandomCard: List<Int>

fun lowerBound(N: Int, target:Int): Int{
    var start = 0
    var end = N

    while(start < end) {
        var mid = (start + end) / 2
        if (SanggunCard[mid] >= target) end = mid
        else start = mid + 1
    }

    return start
}

fun upperBound(N: Int, target: Int): Int {
    var start = 0
    var end = N

    while(start < end) {
        var mid = (start + end) / 2
        if(SanggunCard[mid] > target) end = mid
        else start = mid + 1
    }

    return start
}

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    SanggunCard = br.readLine().split(" ").map { it.toInt() }.sorted()

    val M = br.readLine().toInt()
    RandomCard = br.readLine().split(" ").map { it.toInt() }

    for (i in 0 until M) {
        bw.append("${upperBound(N, RandomCard[i]) - lowerBound(N, RandomCard[i])}")
        if (i != M - 1) {
            bw.append(" ")
        }
    }

    bw.flush()
    bw.close()
}