import kotlin.math.absoluteValue
import kotlin.math.min

lateinit var brokenButton: Array<Int>
lateinit var targetChannelArray: Array<Int>
var result = Int.MAX_VALUE

fun dfs(nowChannel: Int, targetChannel: Int, count: Int, position: Int) {
    // 현재 찾고 싶은 숫자
    val nowPositionTargetNumber = if (position <= targetChannelArray.lastIndex) targetChannelArray[position] else -1

    // 채널을 정확히 갈 수 있으면
    if (nowChannel == targetChannel && nowPositionTargetNumber == -1) {
        result = min(count, result)
        return
    }

    // 채널에 정확히 안 간 상태고 자릿수도 안 맞는데, 혹시 +- 로 갈 수 있으면
    if (nowChannel != targetChannel && (targetChannel - nowChannel).absoluteValue < 19)
        result = min(count + (targetChannel - nowChannel).absoluteValue, result)

    // 채널에 정확히 안 간 상탠데 자릿수는 맞을 때, 혹시 +- 로 갈 수 있으면 (+ 자릿수 하나 더 했을 때 +-)
    if (nowChannel != targetChannel && nowPositionTargetNumber == -1) {
        var temp = nowChannel
        for (i in 0..9) {
            if (brokenButton.contains(i))
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
    if (nowPositionTargetNumber != -1) {
        if (!brokenButton.contains(nowPositionTargetNumber))
            dfs(nowChannel * 10 + nowPositionTargetNumber, targetChannel, count + 1, position + 1)

        for (i in 0..9){
            if (brokenButton.contains(i))
                continue
            dfs(nowChannel * 10 + i, targetChannel, count + 1, position + 1)
        }
    }

}

fun main() {
    val br = System.`in`.bufferedReader()

    val N = br.readLine().toInt()
    targetChannelArray = N.toString().map { it.code - 48 }.toTypedArray()

    val M = br.readLine().toInt()
    brokenButton = if (M > 0)
        br.readLine().split(" ").map { it.toInt() }.toTypedArray()
    else
        emptyArray()

    dfs(0, N, 0, 0)
    result = min(result, (N - 100).absoluteValue)

    print(result)
}