/**
	Assignment 2
**/
class Main {
	static public function main():Void {
		var pairs:Map<String, Int> = [
			"AX" => 4,
			"BX" => 1,
			"CX" => 7,
			"AY" => 8,
			"BY" => 5,
			"CY" => 2,
			"AZ" => 3,
			"BZ" => 9,
			"CZ" => 6
		];

		var content:String = StringTools.replace(sys.io.File.getContent('data.txt'), " ", "");
		var lines:Array<String> = content.split('\r').map(x -> StringTools.trim(x));
		var sum:Int = 0;

		for (v in lines) {
			if (v == '') {
				continue;
			}
			sum += pairs[v];
		}

		trace("Assignment 1:", sum);

		var pairs:Map<String, Int> = [
			"AX" => 3,
			"BX" => 1,
			"CX" => 2,
			"AY" => 4,
			"BY" => 5,
			"CY" => 6,
			"AZ" => 8,
			"BZ" => 9,
			"CZ" => 7
		];

		var content:String = StringTools.replace(sys.io.File.getContent('data.txt'), " ", "");
		var lines:Array<String> = content.split('\r').map(x -> StringTools.trim(x));
		var sum:Int = 0;

		for (v in lines) {
			if (v == '') {
				continue;
			}
			sum += pairs[v];
		}

		trace("Assignment 2:", sum);
	}
}
