import java.util.*

fun main() {
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val N = br.readLine().toInt()
    val cardList: Queue<Int> = LinkedList()
    for (i in 1..N)
        cardList.add(i)

    while (cardList.size != 1) {
        cardList.poll()
        cardList.add(cardList.poll())
    }
    print("${cardList.peek()}")
}