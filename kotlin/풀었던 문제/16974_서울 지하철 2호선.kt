//import java.util.*
//import kotlin.collections.ArrayList
//
//lateinit var linkedList:Array<ArrayList<Int>>
//lateinit var visit:BooleanArray
//
//fun bfs(start: Int): Int{
//    if(linkedList[start].size == 3)
//        return 0
//
//    var queue: Queue<Int> = LinkedList()
//    var reach = 0
//    var move = 0
//
//    queue.add(start)
//
//    while(queue.isNotEmpty()){
//        var now = queue.poll()
// 
//        if(linkedList[now].size == 3){
//            reach++
//            if(reach == 2)
//                return 0
//        }
//
//        for(i in 0..linkedList[now].size){
//            if(visit[linkedList[now][i]])
//                continue
//            visit[linkedList[now][i]] = true
//            queue.add(linkedList[now][i])
//        }
//    }
//
//
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
//    for(i in 0..N){
//        print("$i : ")
//        for(j in 0..linkedList[i].lastIndex){
//            print("${linkedList[i][j]} ")
//        }
//        println()
//    }
//
//    for(i in 1..N){
//        bfs(i)
//    }
//}