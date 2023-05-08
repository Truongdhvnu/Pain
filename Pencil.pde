class Pencil {
    /*
    (buttonX0, buttonY0) la go trai tren cua button, (buttonX1, buttonY1) la goc phai duoi cua button
    */
    private int buttonX0 = 1030;
    private int buttonY0 = 25;
    private int buttonX1 = 1070;
    private int buttonY1 = 75;

    private int sizeBorder = 10;
    private ArrayList<Point> pointList = new ArrayList<>();
    private ArrayList<Point> realPointList = new ArrayList<>();
    private PApplet p = new PApplet();
    
    boolean mode = false;

    Pencil(PApplet p) {
        this.p = p;
    };

    Pencil(ArrayList<Point> plist) {
        this.pointList = plist;
        for(Point p: plist) {
            realPointList.add(new Point(p.getX()/Paint.canvasToRealRatio, (p.getY()-canvas.yWorkingAreaStart)/Paint.canvasToRealRatio));
        }
    }

    public ArrayList<Point> getPointList() {
        return this.pointList;
    }

    public void setPointList(ArrayList<Point> pointList) {
        this.pointList = pointList;
    }

    public ArrayList<Point> getRealPointList() {
        return this.realPointList;
    }
    
    boolean addPoint(Point p) {
        if(pointList.size() == 0) {
            pointList.add(p);
            realPointList.add(new Point(p.getX()/Paint.canvasToRealRatio, (p.getY()-canvas.yWorkingAreaStart)/Paint.canvasToRealRatio));
            return true;
        } else {
            Point temp = pointList.get(pointList.size() - 1);
            if(abs(temp.getX() - p.getX()) >= canvasStepGather || abs(temp.getY() - p.getY()) >= canvasStepGather) {
                pointList.add(p);
                realPointList.add(new Point(p.getX()/Paint.canvasToRealRatio, (p.getY()-canvas.yWorkingAreaStart)/Paint.canvasToRealRatio));
                return true;
            }
            return false;
        }
    }

    boolean isInsideButton() {
        if(p.mouseX > this.buttonX0 && p.mouseX < this.buttonX1
                && p.mouseY > this.buttonY0 && p.mouseY < this.buttonY1) {
                      this.mode = true;
                      return true;
        }
        return false;
    }

    void buttonActive() {
        shape(TOOLBAR, 0, 0, 1920, 1000);
        p.fill(195, 230, 240, 60);
        p.stroke(255);
        p.rect((this.buttonX0 + this.buttonX1) / 2.0, (this.buttonY0 + this.buttonY1) / 2.0
             ,this.buttonX1 - this.buttonX0 + this.sizeBorder, this.buttonY1 - this.buttonY0 + this.sizeBorder);
    }

    void setMode() {
        Paint.mode = Paint.modePencil;
    }

    Pencil copy() {
        ArrayList<Point> p = new ArrayList<>();
        for(Point temp : this.pointList) {
            p.add(new Point(temp.getX(), temp.getY()));
        }
        Pencil pencil_temp = new Pencil(p);
        pencil_temp.p = this.p; // ke ca de p private van truy cap truc tiep dc vi private la truy cap noi bo lop ma :V
        return pencil_temp;
    }

    void show() {
        p.stroke(0);
        if(pointList.size() >= 2) {
            for(int i = 1; i < pointList.size(); i++) {
                p.line(pointList.get(i - 1).getX(), pointList.get(i - 1).getY(), pointList.get(i).getX(), pointList.get(i).getY());
            }
        }
        //System.out.println("real point of pencil:");
        //for(Point p: this.realPointList) {
        //    System.out.println(p);
        //}
    }
    
}
