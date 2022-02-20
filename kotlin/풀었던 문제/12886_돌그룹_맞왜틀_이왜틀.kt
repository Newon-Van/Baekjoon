import java.util.*

data class Stones(var A: Int, var B: Int, var C: Int)

fun bfs(A: Int, B: Int, C: Int): Int {
    if (A == B && B == C && C == A)
        return 1
    var result = 0

    var queue: Queue<Stones> = LinkedList()
    var now: Stones
    var next: Stones
    var visit = Array(1000) { Array(1000) { Array(1000) { false } } }
    queue.add(Stones(A, B, C))
    visit[A][B][C] = true

    while (queue.isNotEmpty()) {
        now = queue.poll()
        next = now

        for (i in 1..3) {
            when (i) {
                1 -> {
                    if (now.A == now.B)
                        continue
                    next = if (now.A > now.B)
                        Stones(now.A - now.B, now.B + now.B, now.C)
                    else
                        Stones(now.A + now.A, now.B - now.A, now.C)
                }
                2 -> {
                    if (now.B == now.C)
                        continue
                    next = if (now.B > now.C)
                        Stones(now.A, now.B - now.C, now.C + now.C)
                    else
                        Stones(now.A, now.B + now.B, now.C - now.B)
                }
                3 -> {
                    if (now.A == now.C)
                        continue
                    next = if (now.A > now.C)
                        Stones(now.A - now.C, now.B, now.C + now.C)
                    else
                        Stones(now.A + now.A, now.B, now.C - now.A)
                }
            }
            if (next.A > 999 || next.B > 999 || next.C > 999 || next.A < 0 || next.B < 0 || next.C < 0)
                continue

            if (visit[next.A][next.B][next.C])
                continue

            if (next.A == next.B && next.B == next.C && next.A == next.C) {
                result = 1
                return result
            }

            queue.add(next)
            visit[next.A][next.B][next.C] = true
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