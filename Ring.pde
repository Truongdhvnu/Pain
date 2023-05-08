class Ring extends Shape {
    /*
    (buttonX0, buttonY0) la go trai tren cua button, (buttonX1, buttonY1) la goc phai duoi cua button
    */
    private int buttonX0 = 735;
    private int buttonY0 = 25;
    private int buttonX1 = 785;
    private int buttonY1 = 75;

    private int widthInit = 160;
    private int heightInit = 160;
    /*
    co the khai bao la static nhung processing ide thi ko dc
    luu y; cho nay co the khong can khai bao va dung 2 bien widthInit va heightInit
    bang cach: mang cac bien height va width xuong lop con, nhung khi do: gia tri khoi tao nay bi co dinh va khong thay doi qua ham dc
    hoac     : set gia tri mac dinh tai lop cha, nhung khi do: gia tri mac dinh cho tat ca cac hinh
     */
    boolean mode = false;

    public Ring(PApplet p, int x0, int y0, int width, int height) {
        this.p = p;
        this.x0 = x0;
        this.y0 = y0;
        this.width = width;
        this.height = height;
    }

    public Ring(PApplet p) {
        this.p = p;
        this.x0 = p.mouseX;
        this.y0 = p.mouseY;
        this.width = this.widthInit;
        this.height = this.heightInit;
    }

    public int getWidthInit() {
        return widthInit;
    }

    public void setWidthInit(int widthInit) {
        this.widthInit = widthInit;
    }

    public int getHeightInit() {
        return heightInit;
    }

    public void setHeightInit(int heightInit) {
        this.heightInit = heightInit;
    }

    int getXInit() {
        return this.x0 - (int)(this.width/2);
    }

    int getYInit() {
        return this.y0 - (int)(this.height/2);
    }

    boolean isInLeftBorder() {
        return abs(this.x0 + this.width / 2.0 - p.mouseX) < 15
                && p.mouseY > this.y0 - this.height / 2.0 + 15
                && p.mouseY < this.y0 + this.height / 2.0 - 15;
    }

    boolean isInDownBorder() {
        return p.mouseX > this.x0 - this.width / 2.0 + 15
                && p.mouseX < this.x0 + this.width / 2.0 - 15
                && abs(this.y0 + this.height / 2.0 - p.mouseY) < 15;
    }

    boolean isInDownRightCorner() {
        return abs(this.x0 + this.width / 2.0 - p.mouseX) < 15
                && abs(this.y0 + this.height / 2.0 - p.mouseY) < 15;
    }

    boolean isInside() {
        return abs(p.mouseX - this.x0) < this.width / 2.0 - 15 / 2.0
                && abs(p.mouseY - this.y0) < this.height / 2.0 - 15 / 2.0;
    }

    boolean isInsideButton() {
        if(p.mouseX > this.buttonX0 && p.mouseX < this.buttonX1
                && p.mouseY > this.buttonY0 && p.mouseY < this.buttonY1) {
                      this.mode = true;
                      return true;
        }
        return false;
    }

    void resize() {

    }

    void buttonActive() {
        shape(TOOLBAR, 0, 0, 1920, 1000);
        p.fill(195, 230, 240, 60);
        p.stroke(255);
        p.rect((this.buttonX0 + this.buttonX1) / 2.0, (this.buttonY0 + this.buttonY1) / 2.0
             ,this.buttonX1 - this.buttonX0 + this.sizeBorder, this.buttonY1 - this.buttonY0 + this.sizeBorder);
    }

    void init() {
        p.fill(195, 220, 240, 140);
        p.stroke(190, 230, 250);
        p.rect(this.x0, this.y0, this.width + sizeBorder, this.height + sizeBorder);
        this.show();
    }
    
    void refresh() {
        this.width = this.widthInit;
        this.height = this.heightInit;
    }

    void setMode() {
        Paint.mode = Paint.modeSelected;
    }

    void show() {
        p.noFill();
        p.stroke(0);
        p.ellipse(this.x0, this.y0, this.width, this.height);
    }

    Ring copy() {
        return new Ring(this.p, this.x0, this.y0, this.width, this.height);
    }
}
