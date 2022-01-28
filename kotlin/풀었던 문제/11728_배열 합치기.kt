//var array = mutableListOf<Int>()
//lateinit var temp: Array<Int>
//
//fun merge(start: Int, end: Int) {
//    val mid = (start + end) / 2
//    var leftIndex = start
//    var rightIndex = mid
//    for (i in start until end) {
//        if (rightIndex == end) temp[i] = array[leftIndex++]
//        else if (leftIndex == mid) temp[i] = array[rightIndex++]
//        else if (array[leftIndex] <= array[rightIndex]) temp[i] = array[leftIndex++]
//        else temp[i] = array[rightIndex++]
//    }
//    for(i in start until end)
//        array[i] = temp[i]
//}
//
//fun mergeSort(start: Int, end: Int) {
//    if (start + 1 == end) return
//    val mid = (start + end) / 2
//    mergeSort(start, mid)
//    mergeSort(mid, end)
//    merge(start, end)
//}
//
//fun main() {
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val (N, M) = br.readLine().split(" ").map { it.toInt() }
//    repeat(2){
//        array += br.readLine().split(" ").map { it.toInt() }.toList()
//    }
//
//    temp = Array(array.size) { 0 }
//
//    mergeSort(0, array.size)
//    for (i in temp.indices) {
//        bw.append("${temp[i]}")
//        if (i != temp.lastIndex)
//            bw.append(" ")
//    }
//
//    bw.flush()
//    bw.close()
//}