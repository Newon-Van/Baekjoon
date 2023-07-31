import kotlin.math.*

fun main(){
	val N = readLine()!!.toDouble()
	val sqrtN = sqrt(N).toInt()
	var NisPrime = true
	for (i in 2..sqrtN) {
		if( sqrtN % i == 0) {
			NisPrime = false
		}
	}
	println(NisPrime)
}
