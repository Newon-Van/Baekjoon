import java.util.*

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    var N = br.readLine().toInt()
    var stringTokenizer : StringTokenizer
    var deque = ArrayDeque<Int>()

    while (N > 0) {
        stringTokenizer = StringTokenizer(br.readLine(), " ")
        when(stringTokenizer.nextToken()){
            "push_front" -> {
                deque.addFirst(stringTokenizer.nextToken().toInt())
                N--
                continue
            }
            "push_back" -> {
                deque.addLast(stringTokenizer.nextToken().toInt())
                N--
                continue
            }
            "pop_front" -> {
                if (deque.isNotEmpty())
                    bw.append("${deque.poll()}")
                else
                    bw.append("-1")
            }
            "pop_back" -> {
                if (deque.isNotEmpty())
                    bw.append("${deque.pollLast()}")
                else
                    bw.append("-1")
            }
            "size" -> {
                bw.append("${deque.size}")
            }
            "empty" -> {
                if (deque.isNotEmpty())
                    bw.append("0")
                else
                    bw.append("1")
            }
            "front" -> {
                if (deque.isNotEmpty())
                    bw.append("${deque.peek()}")
                else
                    bw.append("-1")
            }
            "back" -> {
                if (deque.isNotEmpty())
                    bw.append("${deque.peekLast()}")
                else
                    bw.append("-1")
            }
        }
        if (N != 1)
            bw.append("\n")
        N--
    }
    bw.flush()
    bw.close()
}