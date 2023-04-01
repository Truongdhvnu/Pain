class Pencil {
    ArrayList<Point> pointList = new ArrayList<>();
    private PApplet p = new PApplet();
    int stepGather = (int)(5);
    boolean mode = false;

    Pencil(PApplet p) {
        this.p = p;
    };

    Pencil(ArrayList<Point> p) {
        this.pointList = p;
    }

    public int getStepGather() {
        return this.stepGather;
    }

    public void setStepGather(float stepGather) {
        this.stepGather = (int)(stepGather);
    }

    public ArrayList<Point> getPointList() {
        return this.pointList;
    }

    public void setPointList(ArrayList<Point> pointList) {
        this.pointList = pointList;
    }

    boolean addPoint(Point p) {
        if(pointList.size() == 0) {
            pointList.add(p);
            return true;
        } else {
            Point temp = pointList.get(pointList.size() - 1);
            if(abs(temp.getX() - p.getX()) >= stepGather || abs(temp.getY() - p.getY()) >= stepGather) {
                pointList.add(p);
                return true;
            }
            return false;
        }
    }

    void buttonInit() {
        if(this.mode) {
            p.fill(195, 230, 240);
            p.stroke(210, 230, 240);
            p.rect(408, 50, 142, 80);
        }
        p.fill(250, 250, 250);
        p.stroke(0);
        p.rect(408, 50, 112, 70);
    }

    void buttonReset() {
        p.fill(220, 220, 220);
        p.stroke(220, 220, 220);
        p.rect(408, 50, 142, 80);
        this.buttonInit(); // this.mode should be false
    }

    void setMode() {
        Pain.mode = Pain.modePencil;
    }

    void toggle() {
        if(this.mode) {
            this.mode = false;
            this.buttonReset();
            Pain.mode = Pain.modeWaiting;
        } else {
            this.mode = true;
            this.buttonInit();
            Pain.mode = Pain.modePencil;
        }
    }

    Pencil copy() {
        ArrayList<Point> p = new ArrayList<>();
        for(Point temp : this.pointList) {
            p.add(new Point(temp.getX(), temp.getY()));
        }
        Pencil pencil_temp = new Pencil(p);
        pencil_temp.setStepGather(this.stepGather);
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
    }
}
