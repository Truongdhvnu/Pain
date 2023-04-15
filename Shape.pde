abstract class Shape {
    protected PApplet p = new PApplet();
    protected int width = 0;
    protected int height = 0;
    protected int x0 = 0;
    protected int y0 = 0;
    protected int sizeBorder = 7;

    protected int getSizeBorder() {
        return sizeBorder;
    }

    protected void setSizeBorder(int sizeBorder) {
        this.sizeBorder = sizeBorder;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getX0() {
        return x0;
    }

    public void setX0(int x0) {
        this.x0 = x0;
    }

    public int getY0() {
        return y0;
    }

    public void setY0(int y0) {
        this.y0 = y0;
    }

    abstract int getXInit();
    abstract int getYInit();
    abstract boolean isInLeftBorder();
    abstract boolean isInDownBorder();
    abstract boolean isInDownRightCorner();
    abstract boolean isInside();
    abstract boolean isInsideButton();
    abstract void resize();
    abstract void buttonActive();
    abstract void init();
    abstract void refresh();
    abstract void show();
    abstract Shape copy();
}
