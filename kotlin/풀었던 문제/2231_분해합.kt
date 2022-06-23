fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine()
    var result = 0
    val limit = N.toInt() - N.length * 9

    for (i in limit..N.toInt()) {
        result = i
        i.toString().forEach {
            result += it.code - 48
        }

        if (result == N.toInt()){
            bw.append("$i")
            break
        }

    }
    if (result != N.toInt())
        bw.append("0")

    bw.flush()
    bw.close()
}