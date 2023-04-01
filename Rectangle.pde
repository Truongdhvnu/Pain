class Rectangle extends Shape{
    int x0 = 0;
    int y0 = 0;
    int widthInit = 160;
    int heightInit = 160;
    int sizeBorder = 10;
    boolean mode = false;

    public Rectangle(PApplet p, int x0, int y0, int width, int height) {
        this.p = p;
        this.x0 = x0;
        this.y0 = y0;
        this.width = width;
        this.height = height;
    }

    public Rectangle() {}

    public Rectangle(PApplet p) {
        this.p = p;
    }
    
    int getX0() {
      return this.x0;
    }
    
    int getY0() {
      return this.y0;
    }
    
    void setX0(int x0) {
        this.x0 = x0;
    }

    void setY0(int y0) {
        this.y0 = y0;
    }

    void setWidth(int width) {
        this.width = width;
    }

    void setHeight(int height) {
        this.height = height;
    }

    int getWidth() {
        return this.width;
    }

    int getHeight() {
        return this.height;
    }
    
    int getxInit() {
        return this.x0 - int(this.width/2);
    }

    int getyInit() {
        return this.y0 - int(this.height/2);
    }
    
    boolean isInLeftBorder() {
        if(abs(this.x0 + this.width/2.0 - p.mouseX) < 15 
            && p.mouseY > this.y0 - this.height/2.0 + 15 
                && p.mouseY < this.y0 + this.height/2.0 - 15 ) {
            return true;
        }
        return false;
    }

    boolean isInDownBorder() {
        if(p.mouseX > this.x0 - this.width/2.0 + 15 
            && p.mouseX < this.x0 + this.width/2.0 - 15 
                && abs(this.y0 + this.height/2.0 - p.mouseY) < 15) {
                    return true;
        }
        return false;
    }

    boolean isInDownRightCorner() {
        if(abs(this.x0 + this.width/2.0 - p.mouseX) < 15 
            && abs(this.y0 + this.height/2.0 - p.mouseY) < 15) {
            return true;
        }
        return false;
    }

    boolean isInside() {
        if(abs(p.mouseX - this.x0) < this.width / 2.0 - 15/2.0 
            && abs(p.mouseY - this.y0) < this.height/2.0 - 15/2.0) {
                return true;
        }
        return false;
    }

    void resize() {

    }
    
    void buttonInit() {
        if(mode) {
            p.fill(195, 230, 240);
            p.stroke(210, 230, 240);
            p.rect(231, 50, 142, 80);
        }
        p.fill(250, 250, 250);
        p.stroke(0);
        p.rect(231, 50, 112, 70);
    }

    void buttonReset() {
        p.fill(220, 220, 220);
        p.stroke(220, 220, 220);
        p.rect(231, 50, 142, 80);
        this.buttonInit();// mode should be false
    }

    void init() {
        p.fill(195, 220, 230, 120); // opacity
        p.stroke(190, 230, 250);
        p.rect(this.x0, this.y0, this.width + this.sizeBorder, this.height + this.sizeBorder);
        this.show();
    }
    
    void setMode() {
        Pain.mode = Pain.modeSelected;
    }
    
    void toggle() {
        if(mode) {
            mode = false;
            this.buttonReset();
            Pain.mode = Pain.modeWaiting;
        } else {
            mode = true;
            this.buttonInit();
            Pain.mode = Pain.modeSelected;
        }
    }

    void show() {
        noFill();
        stroke(0);
        rect(this.x0, this.y0, this.width, this.height);
    }
    
    Rectangle copy() {
        Rectangle a = new Rectangle(this.p, this.x0, this.y0, this.width, this.height);
        return a;
    }
}
