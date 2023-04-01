class Canvas {
    int xWorkingAreaEnd = 1095;
    int xWorkingAreaStart = 0;
    int yWorkingAreaEnd = 985;
    int yWorkingAreaStart = 110;
    Ring ring; // luc khoi tao p dang == null nen Ring ring = new Ring(p) la bi vo hieu => phai set trong instructor
    Rectangle rectangle;
    Pencil pencil;
    PApplet p = new PApplet(); // Pain.p se mo di (tuong duong vs khong co) vi Canvas khong co ham khoi tao khong tham so, tuc bien nay se luon duoc gan
    //    PApplet p = Pain.p; de the nay co ve hop ly nhu thuc te lai khong hoat dong why??
    public Canvas(PApplet p) {
        this.p = p;
        this.ring = new Ring(p);
        this.rectangle = new Rectangle(p);
        this.pencil = new Pencil(p);
    }

    /*
    Khong the thay doan code tren bang code sau ( gan mac dinh p la Pain.p va khong can gan trong luc khoi tao nua, tai sao??
    PApplet p = Pain.p;
    public Canvas();
     */

    void buttonInit() {
        ring.buttonInit();
        rectangle.buttonInit();
        pencil.buttonInit();
    }

    void workingAreaInit() {
        //size of working area is 1095 x 875 (~4/5)
        p.fill(250, 250, 250); //cung chang the thay p bang Pain.p thai sao ??
        p.stroke(255);
        p.rect(547, 562, 1095, 875);
    }

    void canvasRefine() {
        //toolbar
        p.fill(220, 220, 220);
        p.stroke(255);
        p.rect(960, 50, 1920, 100);
        //rift
        p.fill(210, 230, 240);
        p.stroke(210, 230, 240);
        p.rect(960, 112, 1920, 25);
        //right area
        p.fill(210, 230, 240);
        p.stroke(210, 230, 240);
        p.rect(1507, 562, 825, 875);
        this.buttonInit();
    }
}
