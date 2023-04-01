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
Shape tempShape; // can't create an instance of an abstract class

ArrayList<Pencil> pencil = new ArrayList<>();
Pencil tempPencil = new Pencil(this);

//Fuction f = new Fuction(2000, 5000, -2000, 2000);

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
    if(mouseX > 35 && mouseX < 115 && mouseY > 15 && mouseY < 85) {
        if(canvas.rectangle.mode) {
            canvas.rectangle.toggle();
        } else if(canvas.pencil.mode) {
            canvas.pencil.toggle();
        }
        canvas.ring.toggle();
    } else if(mouseX > 175 && mouseX < 175 + 112 && mouseY > 15 && mouseY < 85) {
        if(canvas.ring.mode) {
            canvas.ring.toggle();
        } else if(canvas.pencil.mode) {
            canvas.pencil.toggle();
        }
        canvas.rectangle.toggle();
    } else if(mouseX > 352 && mouseX < 352 + 112 && mouseY > 15 && mouseY < 85) {
        if(canvas.rectangle.mode) {
            canvas.rectangle.toggle();
        } if(canvas.ring.mode) {
            canvas.ring.toggle();
        }
        canvas.pencil.toggle();
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
    surface.setLocation(-10, 0);
    rectMode(CENTER);
}

public void draw() {
    background(210, 230, 240);
    canvas.workingAreaInit();

    for(Shape s: shape) {
        s.show();
    }

    for(Pencil p: pencil) {
        p.show();
    }

    canvas.canvasRefine();

    //f.show();
    line(200, 200, 600, 600);

    if(mode == Pain.modeSelected) {
        // if part of shape inside working area
        if(mouseX < 1095 && mouseY > 105) {
            if(canvas.ring.mode) {
                tempShape = new Ring(this);
                tempShape.show();
            } else if(canvas.rectangle.mode) {
                tempShape = new Rectangle(this);
                tempShape.show();
            }
            // co the sửa thành tempShape = canvas.checkMode() hàm này dùng vị trí con trỏ để khởi tạo đối tượng phù hợp(dat cau lenh nay trong ham click luon
            //sau do o day thay doi x0, y0 va show thoi
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
