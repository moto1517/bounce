float h = 44;

void heat() {
	if (count == 0) {
		h++;
		if (h > 44) {
			h = 44;
		}
	} else{
		h = h - count * 0.01;
		if (h < 0) {
			h = 0;
		}
	}
	ball = color(h,100,100);
}
