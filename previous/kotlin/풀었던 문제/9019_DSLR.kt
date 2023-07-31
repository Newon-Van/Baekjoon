import java.util.*
import kotlin.collections.ArrayList

data class Trace(var previousIndex: Int, var command: Char)

var traceList = Array(10000) { Trace(it, ' ') }

// traceList 의 인덱스 값 == 실제 해당 값(123 이면 123)
// 데이터클래스 Trace의 index == 해당 값에 오기 전에 들렸던 숫자, command = 이전의 숫자에서 지금의 숫자로 오기 위해 필요한 커맨드
// 데이터클래스 Trace 는 traceList의 배열 형태를 지정할때만 에서만 사용되고, 다른 배열은 Int 배열


fun bfs(A: Int, B: Int) {
    var queue: Queue<Int> = LinkedList()
    var visit = Array(10000) { false }
    var n: Int
    var next: Int
    var digit = Array<Int>(4) { 0 }
    var tempDigit: Array<Int>
    var pow = 1
    var temp: Int
    var tempIndex: Int
    val commandList = arrayOf('D', 'S', 'L', 'R')
    queue.add(A)
    visit[A] = true

    while (queue.isNotEmpty()) {
        n = queue.poll()
        next = 0
        temp = n
        tempIndex = 3
        if (temp == 0)
            digit = Array(4) { 0 }
        else
            digit = Array(4) {0}
            while (temp != 0) {
                digit[tempIndex] = temp % 10
                temp /= 10
                tempIndex--
            }

        // temp 로 받은 숫자 n 을 4자리화 시키는 작업.

        for (command in commandList) {
            tempDigit = digit.copyOf()
            pow = 1 // L, R 을 진행할 때 생기는 공백을 처리하기 위한 변수
            when (command) {
                'D' -> {
                    next = if (n * 2 >= 10000)
                        (n * 2) % 10000
                    else
                        n * 2
                }

                'S' -> {
                    next = if (n - 1 == -1)
                        9999
                    else
                        n - 1
                }

                'L' -> {
                    temp = tempDigit[0]
                    for (i in 0 until tempDigit.lastIndex)
                        tempDigit[i] = tempDigit[i + 1]
                    tempDigit[tempDigit.lastIndex] = temp

                    next = 0
                    for (i in tempDigit.lastIndex downTo 0) {
                        next += tempDigit[i] * pow
                        pow *= 10
                    }
                }

                'R' -> {
                    temp = tempDigit[tempDigit.lastIndex]
                    for (i in tempDigit.lastIndex downTo 1)
                        tempDigit[i] = tempDigit[i - 1]
                    tempDigit[0] = temp

                    next = 0
                    for (i in tempDigit.lastIndex downTo 0) {
                        next += tempDigit[i] * pow
                        pow *= 10
                    }
                }
            }
            if (visit[next])
                continue

            if (next == B) {
                traceList[next].previousIndex = n
                traceList[next].command = command
                return
            }

            queue.add(next)
            visit[next] = true
            traceList[next].previousIndex = n
            traceList[next].command = command

            // traceList 의 인덱스 == 실제 값, 해당 값에 도달하기 위해 들리는 가장 빠른 값들이 previousIndex 에 저장됨, command 는 previousIndex 에서 현재 인덱스로 오기 위해 필요한 명령어
        }
    }
}


fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    var T = br.readLine().toInt()
    var trace: Int
    var result = ArrayList<Char>()
    while (T-- > 0) {
        var (A, B) = br.readLine().split(" ").map { it.toInt() }
        bfs(A, B)

        trace = B
        while (trace != A) {
            result.add(traceList[trace].command)
            trace = traceList[trace].previousIndex
        }
        // B 에서부터 A 까지 역추적하며 result 에 담는다.

        for (i in result.lastIndex downTo 0)
            bw.append(result[i])

        if (T != 0)
            bw.append("\n")

        result.clear()
    }
    bw.flush()
    bw.close()
}