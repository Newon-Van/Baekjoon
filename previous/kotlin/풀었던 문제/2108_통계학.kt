import kotlin.math.roundToInt

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    val array = Array(N) { br.readLine().toInt() }.sortedArray()

    println(array.groupingBy { it }.eachCount().maxByOrNull { it.value }!!.key)


    bw.append("${array.average().roundToInt()}\n")
    bw.append("${array[(array.lastIndex / 2)]}\n")
    bw.append("${array.groupingBy { it }.eachCount().maxByOrNull { it.value }!!.key}\n")
    bw.append("${array.last() - array.first()}")
    bw.flush()
    bw.close()
}