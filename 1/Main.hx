/**
	Assignment 1
**/
class Main {
	static public function main():Void {
		var content:String = sys.io.File.getContent('data.txt'); // lees bestand
		var lines:Array<Int> = content.split('\r').map(Std.parseInt); // split en maak er ints van

		var sum:Int = 0;
		var results:Array<Int> = new Array<Int>();

		// ga over alle lines heen
		for (v in lines) {
			if (v != null) {
				sum += v;
			} else {
				// voeg de som toe aan de resultaten array als er een empty line is
				results.push(s);
				sum = 0;
			}
		}
		results.sort((a, b) -> b - a); // sorteer de array

		trace("Assignment 1", results[0]); // pak de grootste (0)
		trace("Assignment 2", Lambda.fold(results.slice(0, 3), function(a, s) return a + s, 0)); // pak de eerste 3
	}
}
