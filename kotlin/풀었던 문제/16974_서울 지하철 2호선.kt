//import java.util.*
//import kotlin.collections.ArrayList
//
//lateinit var linkedList:Array<ArrayList<Int>>
//lateinit var visit:BooleanArray
//
//fun bfs(start: Int): Int{
//    if(linkedList[start].size >= 3)
//        return 0
//
//    var queue: Queue<Int> = LinkedList()
//    var now: Int
//    var circleStation = 0
//    var tempMove = 0
//    var move = 0
//
//    queue.add(start)
//    visit[start] = true
//
//    while(queue.isNotEmpty()){
//        now = queue.poll()
//
//        if(circleStation == 0 && linkedList[now].size == 1){
//            move = tempMove
//        }
//
//        if(linkedList[now].size >= 3){
//            circleStation++
//
//            if(circleStation == 2)
//                return 0
//            else if(circleStation == 1 && linkedList[now].size == 1){
//                if(move != 0)
//                    break
//                else{
//                    move = tempMove
//                    break
//                }
//            }
//        }
//
//        for(i in 0..linkedList[now].lastIndex){
//            if(visit[linkedList[now][i]])
//                continue
//            visit[linkedList[now][i]] = true
//            queue.add(linkedList[now][i])
//            tempMove++
//        }
//    }
//
//    return move
//}
//
//fun main(){
//    val br = System.`in`.bufferedReader()
//    val bw = System.`out`.bufferedWriter()
//
//    val N = br.readLine().toInt()
//    linkedList = Array(N + 1){ arrayListOf() }
//    visit = BooleanArray(N + 1){false}
//
//    for(i in 0 until N){
//        var input = br.readLine().split(" ")
//        linkedList[input[0].toInt()].add(input[1].toInt())
//        linkedList[input[1].toInt()].add(input[0].toInt())
//    }
//
////    for(i in 0..N){
////        print("$i : ")
////        for(j in 0..linkedList[i].lastIndex){
////            print("${linkedList[i][j]} ")
////        }
////        println()
////    }
//
//    for(i in 1..N){
//        bw.write("${bfs(i)}")
//        visit = BooleanArray(N + 1){ false }
//        if(i != N)
//            bw.write(" ")
//    }
//    bw.flush()
//    bw.close()
//}