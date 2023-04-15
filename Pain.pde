PShape BORDER;
PShape TOOLBAR;
PShape RIGHTPANEL;
// khong the de cac PShape nay la static va tao cac phuong thuc static (goi ham shape()) o day de goi o class khac, vay phai lam sao de chay trong inteliJ

static int check = 0;
int canvasStepGather = 3;
int realStepGather = 25;

float canvasToRealRatio = 0.07;

public static int mode = 0;
public static int modeWaiting = 0;
public static int modeSelected = 1;
public static int modeRNM = 2; // mode resize and move
public static int modeResizeLeft = 3;
public static int modeResizeDown = 4;
public static int modeResizeDownLeft = 5;
public static int modeMove = 6;
public static int modePencil = 20;

public static int xInit = 0;
public static int yInit = 0;

public static int xClick = 0;
public static int yClick = 0;

Canvas canvas = new Canvas(this);

ArrayList<Shape> shape = new ArrayList<>();
static Shape tempShape; // can't create an instance of an abstract class

ArrayList<Pencil> pencil = new ArrayList<>();
Pencil tempPencil = new Pencil(this);

Fuction f = new Fuction(5000, 6000, -1070, 2000);

//whether tempShape is inside working area
public boolean insideWorkingArea() {
    if(canvas.xWorkingAreaStart < mouseX + tempShape.getWidth()/2.0
            && mouseX - tempShape.getHeight()/2.0 < canvas.xWorkingAreaEnd) {
        return canvas.yWorkingAreaStart < mouseY + tempShape.getHeight() / 2.0
                && mouseY - tempShape.getHeight() / 2.0 < canvas.yWorkingAreaEnd;
    }
    return false;
}

public void checkMode() {
    // dua doan code nay vao file Canvas
    // click on Ring button
    int temp = mode;
    mode = Pain.modeSelected;
    if(canvas.rectangle.isInsideButton()) {
        canvas.rectangle.buttonActive();
        tempShape = new Rectangle(this);
    } else if(canvas.ring.isInsideButton()) {        
        canvas.ring.buttonActive();
        tempShape = new Ring(this);
    } else if(canvas.pencil.isInsideButton()) {
        canvas.pencil.buttonActive();
        canvas.pencil.setMode();
    } else {
        mode = temp;
    }
}

public void mouseClicked() {
    if(mode == Pain.modeWaiting) {
        checkMode();
    } else if(mode == Pain.modeSelected) {
        // ousite of working area
        if(mouseX > 1095 | mouseY < 105) {
            checkMode();
        } else {
            tempShape.setX0(mouseX);
            tempShape.setY0(mouseY);
            xInit = tempShape.getXInit();
            yInit = tempShape.getYInit();
            mode = Pain.modeRNM;
        }
    } else if(mode == Pain.modeRNM) {
        if(tempShape.isInLeftBorder()) {
            mode = Pain.modeResizeLeft;
        } else if(tempShape.isInDownBorder()) {
            mode = Pain.modeResizeDown;
        } else if (tempShape.isInDownRightCorner()) {
            mode = Pain.modeResizeDownLeft;
        } else if (tempShape.isInside()) {
            mode = Pain.modeMove;
        } else {
            shape.add(tempShape.copy());
            tempShape.refresh();
            mode = Pain.modeSelected;
        }
    } else if(mode <= Pain.modeMove) {
        mode = Pain.modeRNM;
    } else if(mode == Pain.modePencil) {
        if(mouseX > 1095 | mouseY < 105) {
              checkMode();
          }
    }
}

public void mouseDragged() {
    if(mode == Pain.modePencil) {
        tempPencil.addPoint(new Point(mouseX, mouseY));
        tempPencil.show();
    }
}

public void mouseReleased() {
    if(mode == Pain.modePencil) {
        int temp = tempPencil.getPointList().size();
        if (temp > 1) {
            pencil.add(tempPencil.copy());
        }
        if(temp > 0) {
            tempPencil.getPointList().clear();
        }
    }
}

public void settings() {
    size(1920, 1000);
}

public void setup() {
    strokeWeight(1);
    surface.setLocation(-10, 0);
    rectMode(CENTER);
    BORDER = loadShape("./svg/Border.svg");
    TOOLBAR = loadShape("./svg/Toolbar.svg");
    RIGHTPANEL = loadShape("./svg/RightPanel.svg");
}

public void draw() {
    canvas.workingAreaInit();

    for(Shape s: shape) {
        s.show();
    }

    for(Pencil p: pencil) {
        p.show();
    }
    if(check == 0) {
      f.show();
      //check++;
    }
    
    canvas.canvasRefine();
    
    if(mode == Pain.modeSelected) {
        // if part of shape inside working area
        if(mouseX < 1095 && mouseY > 105) {
            tempShape.setX0(mouseX);
            tempShape.setY0(mouseY);
            tempShape.show();
        }
    } else if (mode == Pain.modeRNM) {
        tempShape.init();
        if(tempShape.isInLeftBorder()) {
            cursor(CROSS);
        } else if(tempShape.isInDownBorder()) {
            cursor(CROSS);
        } else if (tempShape.isInDownRightCorner()) {
            cursor(MOVE);
        } else {
            cursor(ARROW);
        }
    } else if (mode == Pain.modeResizeLeft) {
        //right
        if(mouseX > xInit) {
            tempShape.setX0((int)((mouseX + xInit)/2)); // (int) is redundant because int/int return int
            tempShape.setWidth(mouseX - xInit);
        }
        tempShape.init();
    } else if(mode == Pain.modeResizeDown) {
        //down
        if(mouseY > yInit) {
            tempShape.setY0((int)((mouseY + yInit)/2));
            tempShape.setHeight(mouseY - yInit);
        }
        tempShape.init();
    } else if(mode == Pain.modeResizeDownLeft) {
        //rightdown corner
        if(mouseX > xInit && mouseY > yInit) {
            tempShape.setX0((int)((mouseX + xInit)/2));
            tempShape.setWidth(mouseX - xInit);
            tempShape.setY0((int)((mouseY + yInit)/2));
            tempShape.setHeight(mouseY - yInit);
        }
        tempShape.init();
    } else if(mode == Pain.modeMove) {
        //inner shape
        if(insideWorkingArea()) {
            tempShape.setX0(mouseX);
            tempShape.setY0(mouseY);
        }
        tempShape.init();
    } else if(mode == Pain.modePencil) {
    }

}
