import java.util.*

data class Stones(var A: Int, var B: Int, var C: Int)

fun bfs(A: Int, B: Int, C: Int): Int {
    if (A == B && B == C && C == A)
        return 1
    else if ((A + B + C) % 3 != 0)
        return 0

    var result = 0

    var queue: Queue<Stones> = LinkedList()
    var now: Stones
    val sum = A + B + C
    var next: MutableList<Int>
    var tempA: Int
    var tempB: Int
    var tempC: Int
    var visit = Array(1501) { Array(1501) { false } }
    queue.add(Stones(A, B, C))
    visit[A][B] = true

    while (queue.isNotEmpty()) {
        now = queue.poll()
        next = mutableListOf(now.A, now.B, sum - now.A - now.B)

        next.forEach { first ->
            next.forEach { second ->
                if (first < second && !visit[first * 2][second - first]) {
                    tempA = first * 2
                    tempB = second - first
                    tempC = sum - tempA - tempB

                    if (tempA == tempB && tempB == tempC && tempA == tempC)
                        return 1

                    visit[tempA][tempB] = true
                    queue.add(Stones(tempA, tempB, tempC))
                }
            }
        }
    }

    return result
}

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val (A, B, C) = br.readLine().split(" ").map { it.toInt() }
    bw.append("${bfs(A, B, C)}")
    bw.flush()
    bw.close()
}