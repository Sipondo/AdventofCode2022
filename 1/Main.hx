/**
	Assignment 1
**/
class Main {
	static public function main():Void {
		var content:String = sys.io.File.getContent('data.txt');
		var lines:Array<Int> = content.split('\r').map(Std.parseInt);

		var s:Int = 0;
		var r:Array<Int> = new Array<Int>();

		for (v in lines) {
			if (v != null) {
				s += v;
			} else {
				r.push(s);
				s = 0;
			}
		}
		r.sort((a, b) -> b - a);
		trace("Assignment 1", r[0]);
		trace("Assignment 2", Lambda.fold(r.slice(0, 3), function(a, s) return a + s, 0));
	}
}
