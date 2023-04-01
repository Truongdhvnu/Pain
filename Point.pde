class Point {
    int x;
    int y;

    int getX() {
        return this.x;
    }

    int getY() {
        return this.y;
    }

    void setX(int x) {
        this.x = x;
    }

    void setY(int y) {
        this.y = y;
    }

    Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public String toString() {
        return String.format("x = %d, y = %d", this.x, this.y);
    }
}
