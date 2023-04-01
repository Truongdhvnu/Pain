class Rectangle extends Shape{
    private int widthInit = 160;
    private int heightInit = 160;
    /*
    co the khai bao la static nhung processing ide thi ko dc
    luu y; cho nay co the khong can khai bao va dung 2 bien widthInit va heightInit
    bang cach: mang cac bien height va width xuong lop con, nhung khi do: gia tri khoi tao nay bi co dinh va khong thay doi qua ham dc
    hoac     : set gia tri mac dinh tai lop cha, nhung khi do: gia tri mac dinh cho tat ca cac hinh
 */
    boolean mode = false;

    public Rectangle(PApplet p, int x0, int y0, int width, int height) {
        this.p = p;
        this.x0 = x0;
        this.y0 = y0;
        this.width = width;
        this.height = height;
    }

    public Rectangle(PApplet p) {
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
        p.rect(this.x0, this.y0, this.width + sizeBorder, this.height + sizeBorder);
        this.show();
    }

    void setMode() {
        Pain.mode = Pain.modeSelected;
    }

    void toggle() {
        if(this.mode) {
            this.mode = false;
            this.buttonReset();
            Pain.mode = Pain.modeWaiting;
        } else {
            this.mode = true;
            this.buttonInit();
            Pain.mode = Pain.modeSelected;
        }
    }

    void show() {
        p.noFill();
        p.stroke(0);
        p.rect(this.x0, this.y0, this.width, this.height);
    }

    Rectangle copy() {
        Rectangle a = new Rectangle(this.p, this.x0, this.y0, this.width, this.height);
        return a;
    }
}
