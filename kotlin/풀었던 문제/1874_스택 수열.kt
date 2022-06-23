import java.util.*

fun main() {
    val br = System.`in`.bufferedReader()
    var bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    var stack = Stack<Int>()
    var result = Stack<String>()
    val target = MutableList(N) { br.readLine().toInt() }

    for (i in 1..N) {
        stack.add(i)
        result.add("+\n")

        while (stack.isNotEmpty() && stack.peek() == target.first()) {
            stack.pop()
            target.removeFirst()
            result.add("-")
            if (target.isNotEmpty())
                result.add("\n")
        }
    }

    if (stack.isEmpty()) {
        result.forEach {
            bw.append(it)
        }
    } else
        bw.append("NO")
    bw.flush()
    bw.close()
}