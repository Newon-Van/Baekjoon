var results = Array(3) { 0 }
var result = 0
var temp = 0
lateinit var cards: Array<Int>
lateinit var visit: BooleanArray

fun backTracking(N: Int, M: Int, cardCount: Int) {
    if (cardCount == 3) {
        temp = results[0] + results[1] + results[2]
        if (temp in (result + 1)..M)
            result = temp
        return
    }

    for (i in cards.indices) {
        if(visit[i])
            continue

        results[cardCount] = cards[i]
        visit[i] = true
        backTracking(N, M, cardCount + 1)
        results[cardCount] = 0
        visit[i] = false
    }
}

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (N, M) = br.readLine().split(" ").map { it.toInt() }
    cards = br.readLine().split(" ").map { it.toInt() }.toTypedArray()
    visit = BooleanArray(N + 1) { false }
    backTracking(N, M, 0)
    bw.append("$result")
    bw.flush()
    bw.close()
}