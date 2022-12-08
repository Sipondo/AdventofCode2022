/**
	Assignment 2
**/
class Main {
	static public function main():Void {
		var content:String = StringTools.replace(sys.io.File.getContent('data.txt'), " ", "");
		var lines:Array<Array<Int>> = content.split('\r').map(x -> StringTools.replace(x, "\n", "").split('').map(y -> Std.parseInt(y)));

		var size = lines.length - 1;
		trace(size);

		var target:Array<Array<Int>> = [for (i in 0...size) [for (j in 0...size) 0]];

		for (x in 0...size) {
			var visible = -1;
			for (y in 0...size) {
				var tree = lines[x][y];
				if (visible >= tree) {
					continue;
				}
				visible = tree;
				target[x][y] = 1;
			}

			var visible = -1;
			for (y in 0...size) {
				var yi = size - 1 - y;
				var tree = lines[x][yi];
				if (visible >= tree) {
					continue;
				}
				visible = tree;
				target[x][yi] = 1;
			}
		}

		for (y in 0...size) {
			var visible = -1;
			for (x in 0...size) {
				var tree = lines[x][y];
				if (visible >= tree) {
					continue;
				}
				visible = tree;
				target[x][y] = 1;
			}

			var visible = -1;
			for (x in 0...size) {
				var xi = size - 1 - x;
				var tree = lines[xi][y];
				if (visible >= tree) {
					continue;
				}
				visible = tree;
				target[xi][y] = 1;
			}
		}

		// trace(target);

		trace("Assignment 1", Lambda.fold(target, function(a, s) return Lambda.fold(a, function(b, t) return b + t, 0) + s, 0)); // pak de eerste 3

		var range:Array<Array<Int>> = [for (i in 0...size) [for (j in 0...size) 1]];

		for (x in 0...size) {
			for (y in 0...size) {
				var tree = lines[x][y];

				// Down
				var vis = 0;
				for (n_x in(x + 1)...size) {
					vis += 1;
					if (lines[n_x][y] >= tree) {
						break;
					}
				}
				range[x][y] *= vis;

				// Up
				vis = 0;
				for (n_x in 1...x + 1) {
					vis += 1;
					var n_xi = x - n_x;
					if (lines[n_xi][y] >= tree) {
						break;
					}
				}
				range[x][y] *= vis;

				// Right
				vis = 0;
				for (n_y in(y + 1)...size) {
					vis += 1;
					if (lines[x][n_y] >= tree) {
						break;
					}
				}
				range[x][y] *= vis;

				// Left
				vis = 0;
				for (n_y in 1...y + 1) {
					vis += 1;
					var n_yi = y - n_y;
					if (lines[x][n_yi] >= tree) {
						break;
					}
				}
				range[x][y] *= vis;
			}
		}

		trace(lines);
		trace(range);

		trace("Assignment 2", Lambda.fold(range, function(a, s) return Math.max(Lambda.fold(a, function(b, t) return Math.max(b, t), 0), s), 0));
	}
}
