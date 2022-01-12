import java.util.*

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    val target = MutableList<Int>(N) { br.readLine().toInt() }
    val array = MutableList(N) { it + 1 }


    var temp: Int
    for (i in 0 until N) {
        if (array[i] == target[0]) {
            bw.append("+\n")
            bw.append("-\n")
            target.removeFirst()
            array.removeFirst()


            while (array.first() == target[0]) {
                bw.append("-\n")
                target.removeFirst()
                array.removeFirst()
            }
        } else
            bw.append("+\n")
    }

    bw.flush()
    bw.close()
}