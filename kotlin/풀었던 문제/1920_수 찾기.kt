//lateinit var controlGroup:List<Int>
//lateinit var targetGroup:List<Int>
//
//fun quickSort(list: List<Int>): List<Int> {
//    if (list.size < 2){
//        return list
//    }
//
//    val pivot = list[list.size / 2]
//    val left = list.filter { it < pivot }
//    val right = list.filter { it > pivot }
//
//    return quickSort(left) + listOf(pivot) + quickSort(right)
//}
//
//fun binarySearch(arr: List<Int>, target: Int): Int {
//    var low = 0
//    var high = arr.lastIndex
//    var mid = 0;
//
//    while (low <= high) {
//        mid = (low + high) / 2
//
//        when {
//            arr[mid] == target -> return 1
//            arr[mid] > target -> high = mid - 1
//            else -> low = mid + 1
//        }
//    }
//    return 0
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val N = br.readLine().toInt()
//    controlGroup = br.readLine().split(" ").map{it.toInt()}.toList()
//    controlGroup = quickSort(controlGroup)
//
//    val M = br.readLine().toInt()
//    targetGroup = br.readLine().split(" ").map{it.toInt()}.toList()
//
//    for (i in 0 until M){
//        bw.append("${binarySearch(controlGroup, targetGroup[i])}")
//        if (i != M - 1)
//            bw.append("\n")
//    }
//    bw.flush()
//    bw.close()
//}