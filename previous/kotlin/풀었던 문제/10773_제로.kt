import java.util.*

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val stack = Stack<Int>()

    repeat(br.readLine()!!.toInt()) {
        val n = br.readLine()!!.toInt()
        if (n == 0) stack.pop()
        else stack.push(n)
    }

    bw.append("${stack.sum()}")
    bw.flush()
    bw.close()
}