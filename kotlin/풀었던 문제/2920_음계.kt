fun main(){
    val br = System.`in`.bufferedReader()
    val bw = System.`out`.bufferedWriter()

    val arr = br.readLine().split(" ").map{it.toInt()}.toTypedArray()
    var check:String = "ascending"

    if(arr[0] == 1 && arr[1] == 2)
        check = "ascending"
    if(arr[0] == 8 && arr[1] == 7)
        check = "descending"

    for(i in 0 until arr.lastIndex){
        if(check == "ascending" && arr[i] + 1 == arr[i + 1])
            continue
        else if(check == "descending" && arr[i] - 1 == arr[i + 1])
            continue
        else{
            check = "mixed"
            break
        }
    }

    bw.write("$check")
    bw.flush()
    bw.close()
}