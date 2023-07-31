import kotlin.math.absoluteValue
import kotlin.math.min

lateinit var brokenButton: Array<Int>
var result = Int.MAX_VALUE

fun dfs(nowChannel: Int, targetChannel: Int, targetChannelDigit: Int, count: Int, position: Int) {
    // 채널을 정확히 갈 수 있으면
    if (nowChannel == targetChannel && position != 0) {
        result = min(count, result)
        return
    }

    // 채널에 정확히 안 간 상태고 자릿수가 1개 차이나는데, 혹시 +- 로 갈 수 있으면
    if (position == targetChannelDigit - 1) {
        result = if (position == 0)
            min(count + (targetChannel - 100).absoluteValue, result)
        else
            min(count + (targetChannel - nowChannel).absoluteValue, result)
    }

    // 채널에 정확히 안 간 상탠데 자릿수는 맞을 때, 혹시 +- 로 갈 수 있으면 (+ 자릿수 하나 더 했을 때 +-)
    if (position == targetChannelDigit) {
        var temp = nowChannel
        for (i in 0..9) {
            if (brokenButton.contains(i) || (position > 1 && nowChannel == 0))
                continue
            temp = nowChannel * 10 + i
            break
        }

        result = min(count + (targetChannel - nowChannel).absoluteValue, result)
        // 혹시 모르니 한번 더 가보기
        result = min(count + 1 + (targetChannel - temp).absoluteValue, result)
        return
    }

    // 범위 벗어나면 컷
    if (nowChannel < 0 || nowChannel > 50000000 || (result != Int.MAX_VALUE && count >= result))
        return

    // 자릿수 안 맞으면 최대한 가까운 수 찾아가기
    if (position < targetChannelDigit) {
        for (i in 0..9) {
            if (brokenButton.contains(i) || (position > 1 && nowChannel == 0))
                continue
            dfs(nowChannel * 10 + i, targetChannel, targetChannelDigit, count + 1, position + 1)
        }
    }

}

fun main() {
    val br = System.`in`.bufferedReader()

    val N = br.readLine().toInt()
    val M = br.readLine().toInt()
    brokenButton = if (M > 0)
        br.readLine().split(" ").map { it.toInt() }.toTypedArray()
    else
        emptyArray()

    dfs(0, N, N.toString().length, 0, 0)
    result = min(result, (N - 100).absoluteValue)

    print(result)
}