class Fuction {
    int x0 = 0;
    int y0 = 0;
    int x1 = 0;
    int x2 = 0;

    ArrayList<Point> pointList = new ArrayList<>();
    ArrayList<Point> pCanvas = new ArrayList<>();
    
    //x0, y0 la vi tri tren working area VOI KICH THUOC THUC(do bang STEPS)
    //x1, x2 la gia tri cua x chay tren truc 1e-3 cm cua do thi
    public Fuction(int x0, int y0, int x1, int x2) {
        this.x0 = x0;
        this.y0 = y0;
        this.x1 = x1;
        this.x2 = x2;
        this.initRealPointList();
        this.initCanvasPointList();
    }

    private void initRealPointList() {
        this.pointList = calculatePoints(realStepGather);
    }

    private void initCanvasPointList() {
          this.pCanvas = calculatePoints(canvasStepGather / canvasToRealRatio);
          for(Point p: this.pCanvas) {
              p.setX(round(p.x * canvasToRealRatio) + canvas.xWorkingAreaStart);
              p.setY(round(p.y * canvasToRealRatio) + canvas.yWorkingAreaStart);
          }
    }

    /*
    / bước nhảy để tính cho tọa độ thực là realStepGather còn cho tọa độ của canvas phải là canvasStepGather / canvasToRealRatio
    / giải thuật ở đây là lưu hướng đang đi của đồ thị nếu lần tính tiếp theo thầy hướng đi ngược lại thì tìm trong khoảng 2 điểm này điểm cực trị
    / chỉ đảm bảo tìm lại cực trị nếu giá trị tiếp theo làm ngược hướng chiều đang đi(do đó phái hiện có cực trị), nếu giá trị tiếp theo
    / đi qua cực trị mà không ngược hướng sign_vx --> khong phát hiện được.
    / điều này có thể làm đơn giản đối với tìm điểm cho mặt phẳng Real nhưng đối với mặt phẳng canvas thì stepGather là float nên cần
    / có 1 số thao tác thêm vào trong code
    / cách này lấy ý tưởng giống như hàm code nhúng đã thực hiện trước đó, nhìn chung thì chưa được tốt (tệ ác), thay đổi phương pháp này tại commit function ver2    
    */
    private ArrayList<Point> calculatePoints(float stepGather) {
        ArrayList<Point> tempPList = new ArrayList<>();

        int sign_vx = this.x1 < this.x2 ? 1 : -1;
        int sign_vy = func(x1) < func(x1 + 1) ? 1 : -1;
        boolean isPeak = false;

        float x = this.x1 * 1.0;
        if(abs(stepGather - canvasStepGather / canvasToRealRatio) < 0.1) {
            x = ((this.x1 * canvasToRealRatio)) / canvasToRealRatio;
        }
        
        //System.out.println(x);
        
        float y = func(x);
        float temp_y = y;
        float temp_x = x;
        
        tempPList.add(new Point(this.x0, this.y0));
        while((this.x2 - x) * sign_vx > 0) {
            temp_y = y;
            temp_x = x;
            while((int)(x * canvasToRealRatio) == (int)(temp_x * canvasToRealRatio)) {
                x = (this.x2 - x) * sign_vx - stepGather > 0 ? x + stepGather * sign_vx : this.x2;
                y = func(x);
                if(isPeak) { // neu dang o dinh thi reset isPeak va thay doi huong tren truc y
                    isPeak = false;
                    sign_vy *= -1;
                } else if(sign_vy * (y - temp_y) < 0) {
                    // can ham floor vi vidu peak = 2000 ma x hien tai = 1999.7 thi se khong tinh la 2000 duoc. peak la so nguyen ung voi toa do real
                    x = floor(temp_x) * 1.0; 
                    do {
                        y = temp_y;
                        x += 1;
                        temp_y = func(x);
                    } while(sign_vy * (temp_y - y) > 0);
                    x -= 1;
                    isPeak = true;
                    x = (round(x * canvasToRealRatio)) / canvasToRealRatio;
                }
            }
            //System.out.println(x);
            tempPList.add(new Point(this.x0 - this.x1 + x, this.y0 - func(this.x1) + y));
        }
        return tempPList;
    }

    private float func(float x) {
        float temp = x * 0.001;
        return temp * temp * 1000;
    }

    void show() {
        stroke(0);
        strokeCap(ROUND);
        for(int i = 0; i < pCanvas.size() - 1; i++) {
            line(pCanvas.get(i).x, pCanvas.get(i).y, pCanvas.get(i + 1).x, pCanvas.get(i + 1).y);
            //System.out.println(pCanvas.get(i));
        }
        //System.out.println("REAL POINTS:");
        //for(Point p: this.pointList) {
        //    System.out.println(p);
        //}
    }
    
}
