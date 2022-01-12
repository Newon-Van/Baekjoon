fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    var inputs = ArrayList<String>()

    repeat(N) {
        inputs.add(br.readLine())
    }

    inputs.sortWith(compareBy({ it.length }, { it }))

    var i = 0
    while (i != inputs.lastIndex) {
        if (inputs[i] == inputs[i + 1]) {
            inputs.removeAt(i)
            i--
        }
        i++
    }

    for (i in inputs.indices) {
        bw.append("${inputs[i]}")
        if (i != inputs.lastIndex)
            bw.append("\n")
    }
    bw.flush()
    bw.close()
}