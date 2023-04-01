class Pencil {
    ArrayList<Point> pointList = new ArrayList<Point>();
    int stepGather = (int)(5);
    boolean mode = false;

    Pencil() {};

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
            fill(195, 230, 240);
            stroke(210, 230, 240);
            rect(408, 50, 142, 80);
        }
        fill(250, 250, 250);
        stroke(0);
        rect(408, 50, 112, 70);
    }

    void buttonReset() {
        fill(220, 220, 220);
        stroke(220, 220, 220);
        rect(408, 50, 142, 80);
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
        return pencil_temp;
    }

    void show() {
      if(pointList.size() >= 2) {
          for(int i = 1; i < pointList.size(); i++) {
              line(pointList.get(i - 1).getX(), pointList.get(i - 1).getY(), pointList.get(i).getX(), pointList.get(i).getY());
          }
      }
    }
}
