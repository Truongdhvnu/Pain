abstract class Shape {
    PApplet p = new PApplet();
    int width = 0;
    int height = 0;
    abstract int getX0();
    abstract int getY0();
    abstract void setX0(int X0);
    abstract void setY0(int Y0);
    abstract int getxInit();
    abstract int getyInit();
    abstract void setWidth(int width);
    abstract void setHeight(int height);
    abstract int getWidth();
    abstract int getHeight();
    abstract boolean isInLeftBorder();
    abstract boolean isInDownBorder();
    abstract boolean isInDownRightCorner();
    abstract boolean isInside();
    abstract void resize();
    abstract void buttonInit();
    abstract void buttonReset();
    abstract void init();
    //abstract void toggle();
    abstract void show();
    abstract Shape copy();
}
