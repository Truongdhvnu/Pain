class Canvas {
    int xworkingAreaEnd = 1095;
    int xWorkingAreaStart = 0;
    int yworkingAreaEnd = 985;
    int yWorkingAreaStart = 110;
    PApplet p = new PApplet();
    Ring ring = new Ring();
    Rectangle rectangle = new Rectangle();
    Pencil pencil = new Pencil();
    public Canvas(PApplet p) {
        this.p = p;
        ring.p = p;
        rectangle.p = p;
    }

    void buttonInit() {
        ring.buttonInit();
        rectangle.buttonInit();
        pencil.buttonInit();
    }

    void workingAreaInit() {
        //size of working area is 1095 x 875 (~4/5)
        p.fill(250, 250, 250);
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
