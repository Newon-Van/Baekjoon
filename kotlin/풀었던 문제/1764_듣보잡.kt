import java.util.*
import kotlin.math.max

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, M) = br.readLine().split(" ").map { it.toInt() }
    var unseePersonArray = Array(N) { "" }
    var unlistenPersonArray = Array(M) { "" }
    var result: Queue<String> = LinkedList()

    for (i in unseePersonArray.indices)
        unseePersonArray[i] = br.readLine()
    for (i in unlistenPersonArray.indices) {
        unlistenPersonArray[i] = br.readLine()
        for (unseePerson in unseePersonArray) {
            if (unlistenPersonArray[i] == unseePerson) {
                result.add(unseePerson)
            }
        }
    }

    for(i in result){
        bw.append(i)
        if (i != result.last())
            bw.append("\n")
    }

    bw.flush()
    bw.close()
}