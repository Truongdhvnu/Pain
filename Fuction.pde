class Fuction {
    int x0 = 0;
    int y0 = 0;
    int x1 = 0;
    int x2 = 0;
    private final float xRatio = 15625.0/1095;
    private final float yRatio = 12500.0/875;
    
    //x0, y0 la vi tri tren working area VOI KICH THUOC THUC(do bang STEPS)
    //x1, x2 la gia tri cua x chay tren truc 1e-3 cm cua do thi
    public Fuction(int x0, int y0, int x1, int x2) {
        this.x0 = x0;
        this.y0 = y0;
        this.x1 = x1;
        this.x2 = x2;
    }

    private float func(int x) {
        float temp = x * 0.001;
        return temp * temp * 1000;
    }

    void show() {
        stroke(0);
        int old_x = int(this.x0 * 1.0 / xRatio) + canvas.xWorkingAreaStart;
        int old_y = int(this.y0 * 1.0 / yRatio) + canvas.yWorkingAreaStart;
        strokeWeight(1);
        strokeCap(ROUND);
        for(int i = x1 + 1; i < x2; i += 8) {
            int new_x = int((this.x0 + abs(i - this.x1)) / xRatio) + canvas.xWorkingAreaStart;
            int new_y = int((this.y0 - func(x1) + func(i)) / yRatio) + canvas.yWorkingAreaStart;
            line(old_x , old_y, new_x, new_y);
            print(old_x + " " + old_y + " " + new_x + " " + new_y+ "\n");
            old_x = new_x;
            old_y = new_y;
        }
        strokeWeight(1);
    }
}
