fun checker(target: Int): Boolean {
    if (target < 10)
        return true

    val temp = target.toString()

    for (i in 0 until temp.lastIndex) {
        if (temp[i] <= temp[i + 1])
            return false
    }
    return true
}

fun main() {
    val br = System.`in`.bufferedReader()

    val N = br.readLine().toInt()
    var count = 0
    var result = 0

    for (i in 1..987654321) {
        if (count == N)
            break
        if (checker(i)) {
            count += 1
            result = i
        }
    }

    if (count + 1 == N && result == 987654321)
        print(9876543210)
    else if (count != N)
        print(-1)
    else
        print(result)
    println()
    print("${System.currentTimeMillis()/1000.0}")
}