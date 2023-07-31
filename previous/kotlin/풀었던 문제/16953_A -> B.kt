var result = -1

fun dfs(now: Long, B: Int, count: Int) {
    if (now > B) return
    if (now.toInt() == B) {
        result = count
        return
    }

    val temp = now
    dfs(temp * 2, B, count + 1)
    dfs((temp * 10) + 1, B, count + 1)
}


fun main() {
    val br = System.`in`.bufferedReader()

    val (A, B) = br.readLine().split(" ").map { it.toInt() }
    dfs(A.toLong(), B, 1)
    print(result)
}