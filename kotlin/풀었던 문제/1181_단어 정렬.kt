fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    var inputs = ArrayList<String>()

    repeat(N) {
        inputs.add(br.readLine())
    }

    inputs.sortWith(comparator = {})

    var i = 0
    while(i != inputs.lastIndex){
        if (i != inputs.lastIndex - 1 && inputs[i] == inputs[i + 1]){
            inputs.removeAt(i)
            i--
        }
        i++
    }

    bw.append("$inputs")
    bw.flush()
    bw.close()
}