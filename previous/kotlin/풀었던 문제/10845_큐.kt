import java.util.*

fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    var N = br.readLine().toInt()
    var stringTokenizer : StringTokenizer
    var queue : Queue<Int> = LinkedList()

    while(N > 0){
        stringTokenizer = StringTokenizer(br.readLine()," ")
        when(stringTokenizer.nextToken()){
            "push" -> {
                queue.add(stringTokenizer.nextToken().toInt())
                N--
                continue
            }
            "pop" -> {
                if (queue.isNotEmpty())
                    bw.append("${queue.poll()}")
                else
                    bw.append("-1")
            }
            "size" -> {
                bw.append("${queue.size}")
            }
            "empty" -> {
                if (queue.isEmpty())
                    bw.append("1")
                else
                    bw.append("0")
            }
            "front" -> {
                if (queue.isNotEmpty())
                    bw.append("${queue.peek()}")
                else
                    bw.append("-1")
            }
            "back" -> {
                if (queue.isNotEmpty())
                    bw.append("${queue.last()}")
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