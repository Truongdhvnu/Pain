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
        for(Point p: this.pointList) {
            p.setX(round(p.x));
            p.setY(round(p.y));
        }
    }

    private void initCanvasPointList() {
          this.pCanvas = calculatePoints(canvasStepGather / canvasToRealRatio);
          for(Point p: this.pCanvas) {
            p.setX(round(p.x * canvasToRealRatio) + canvas.xWorkingAreaStart);
            p.setY(round(p.y * canvasToRealRatio) + canvas.yWorkingAreaStart);
          }
    }

    /*
    / ham nay tinh ra cac gia tri cua cac diem cach deu sau do hieu chinh dim cuc tri
    / vi du: neu y lien tiep co gia tri bang y1 < y2 > y3 vay thi hieu chinh gia tri cuc tri y2
    / stepGather lon nhat tao ra do hieu chinh = stepGather * 2 - 1
    / khong hieu chinh gia tri cuc tri cho canvas's pointlist chi hieu chinh cho real's pointlist 
    */
    private ArrayList<Point> calculatePoints(float stepGather) {
        float x = this.x1 * 1.0;
        if(abs(stepGather - canvasStepGather / canvasToRealRatio) < 0.1) { //stepGather == canvasStepGather / canvasToRealRatio ?
            x = ((int)(this.x1 * canvasToRealRatio)) / canvasToRealRatio;
        }
        float y = func(x);

        int sign_vx = this.x1 < this.x2 ? 1 : -1;
        
        ArrayList<Point> tempPList = new ArrayList<>();
        tempPList.add(new Point(x, y));

        while((this.x2 - x) * sign_vx > 0) {
            x = (this.x2 - x) * sign_vx - stepGather > 0 ? x + stepGather * sign_vx : this.x2;
            y = func(x);
            tempPList.add(new Point(x, y));
        }
        
        //update Extrenum for pointList
        if (stepGather == realStepGather) {
            int list_size = tempPList.size();
            if(list_size > 3) {
                int sign_vy = tempPList.get(0).getY() < tempPList.get(1).getY() ? 1 : -1;
                for(int i = 2; i < list_size; i++) {
                    if ((tempPList.get(i).getY() - tempPList.get(i - 1).getY()) * sign_vy < 0) {
                        x = tempPList.get(i - 2).getX();
                        y = tempPList.get(i - 2).getY();
                        float y_temp = y;
                        do {
                            y = y_temp;
                            x += sign_vx;
                            y_temp = func(x);                    
                        } while((y_temp - y) * sign_vy > 0);
                        x -= sign_vx;
                        tempPList.get(i - 1).setX(x);
                        tempPList.get(i - 1).setY(y);
                        sign_vy *= -1;
                    }
                }
            }
        }
        
        //update ve vij tri ban dau (x0, y0)
        for(Point p: tempPList) {
            p.setX(this.x0 - this.x1 + p.x);
            p.setY(this.y0 - func(this.x1) + p.y);
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
