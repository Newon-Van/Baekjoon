import java.util.*

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    var N = br.readLine().toInt()
    var stack = Stack<Int>()
    var stringTokenizer : StringTokenizer
    while (N > 0) {
        stringTokenizer = StringTokenizer(br.readLine(), " ")
        when (stringTokenizer.nextToken()){
            "push" -> {
                stack.add(stringTokenizer.nextToken().toInt())
                N--
                continue
            }
            "pop" -> {
                if (stack.isNotEmpty())
                    bw.append("${stack.pop()}")
                else
                    bw.append("-1")
            }
            "size" ->
                bw.append("${stack.size}")
            "empty" ->{
                if (stack.isNotEmpty())
                    bw.append("0")
                else
                    bw.append("1")
            }
            "top" -> {
                if (stack.isNotEmpty())
                    bw.append("${stack.peek()}")
                else
                    bw.append("-1")
            }
        }
        if (N > 1)
            bw.append("\n")
        N--
    }
    bw.flush()
    bw.close()
}