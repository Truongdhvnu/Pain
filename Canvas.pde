class Canvas {
    int xWorkingAreaEnd = 1095;
    int xWorkingAreaStart = 0;
    int yWorkingAreaEnd = 985;
    int yWorkingAreaStart = 110;
    Ring ring; // luc khoi tao p dang == null nen Ring ring = new Ring(p) la bi vo hieu => phai set trong instructor
    Rectangle rectangle;
    Pencil pencil;
    SendPoint sendPoint;
    PApplet p = new PApplet(); // Paint.p se mo di (tuong duong vs khong co) vi Canvas khong co ham khoi tao khong tham so, tuc bien nay se luon duoc gan
    //    PApplet p = Paint.p; de the nay co ve hop ly nhu thuc te lai khong hoat dong why??
    public Canvas(PApplet p) {
        this.p = p;
        this.ring = new Ring(p);
        this.rectangle = new Rectangle(p);
        this.pencil = new Pencil(p);
        this.sendPoint = new SendPoint();
    }

    /*
    Khong the thay doan code tren bang code sau ( gan mac dinh p la Paint.p va khong can gan trong luc khoi tao nua, tai sao??
    PApplet p = Paint.p;
    public Canvas();
     */

    void workingAreaInit() {
        //size of working area is 1095 x 875
        p.fill(250, 250, 250); //cung chang the thay p bang Paint.p thai sao ??
        p.stroke(255);
        p.rect(547, 562, 1095, 875);
    }

    void canvasRefine() {
        shape(BORDER, 0, 0, 1920, 1000);
        shape(TOOLBAR, 0, 0, 1920, 1000);
        shape(RIGHTPANEL, 0, 0, 1920, 1000);
        if(Paint.mode < Paint.modePencil && Paint.mode >= Paint.modeSelected) {
            Paint.tempShape.buttonActive();
        } else if (Paint.mode == Paint.modePencil) {
            this.pencil.buttonActive();
        } else if (Paint.mode == Paint.modeSending) {
            this.sendPoint.buttonActive();
        }
    }
}
