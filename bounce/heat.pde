float h = 44;

void heat() {
	if (count == 0) {
		h = h + 0.5;
		if (h > 44) {
			h = 44;
		}
	} else{
		h = h - count * 0.01;
		if (h < 20) {
			h = 20;
		}
	}
	ball = color(h,100,100);
}
