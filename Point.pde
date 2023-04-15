class Point {
    float x;
    float y;

    float getX() {
        return this.x;
    }

    float getY() {
        return this.y;
    }

    void setX(float x) {
        this.x = x;
    }

    void setY(float y) {
        this.y = y;
    }

    Point(float x, float y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public String toString() {
        return String.format("x = %f, y = %f", this.x, this.y);
    }
}
