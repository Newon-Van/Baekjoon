//val bw = System.`out`.bufferedWriter()
//var moveRecord : ArrayList<Pair<Int, Int>> = arrayListOf()
//
//fun hanoiMove(N: Int, a: Int, b: Int, c: Int){
//
//    if(N > 0) {
//        hanoiMove(N - 1, a, c, b)
//        moveRecord.add(Pair(a, c))
//        hanoiMove(N - 1, b, a, c)
//    }
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//
//    val N = br.readLine().toInt()
//    hanoiMove(N, 1, 2, 3)
//
//    bw.append("${moveRecord.size}")
//    bw.newLine()
//    for(i in 0..moveRecord.lastIndex){
//        bw.append("${moveRecord[i].first} ${moveRecord[i].second}")
//        if(i != moveRecord.lastIndex) bw.newLine()
//    }
//
//    bw.flush()
//    bw.close()
//}