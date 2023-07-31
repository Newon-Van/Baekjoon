import java.util.*

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, M) = br.readLine().split(" ").map { it.toInt() }
    var personArray = Array(N + M) { "" }
    var result: Queue<String> = LinkedList()
    var count = 0

    for (i in personArray.indices)
        personArray[i] = br.readLine()

    personArray.sortWith(compareBy { it })
    for (i in 0 until N + M - 1) {
        if (personArray[i] == personArray[i + 1])
            result.add(personArray[i])
    }

    bw.append("${result.size}\n")
    while(result.isNotEmpty()){
        bw.append(result.poll())
        if (result.isNotEmpty())
            bw.append("\n")
    }
    bw.flush()
    bw.close()
}