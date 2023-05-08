class SendPoint {
    private int buttonX0 = 220;
    private int buttonY0 = 20;
    private int buttonX1 = 280;
    private int buttonY1 = 80;
    boolean mode = false;
    
    private ArrayList<Point> realPointList = new ArrayList<>();
    
    public SendPoint() {}
    
    public SendPoint(ArrayList<Point> realPointList) {
        this.realPointList = realPointList;
    }
    
    public ArrayList<Point> getRealPointList() {
        return this.realPointList;
    }
    
    public void setRealPointList(ArrayList<Point> realPointList) {
        this.realPointList = realPointList;
    }
    
    boolean isInsideButton() {
        if(mouseX > this.buttonX0 && mouseX < this.buttonX1
                && mouseY > this.buttonY0 && mouseY < this.buttonY1) {
                      this.mode = true;
                      return true;
        }
        return false;
    }

    void buttonActive() {
        shape(TOOLBAR, 0, 0, 1920, 1000);
        fill(195, 230, 240, 60);
        stroke(255);
        rect((this.buttonX0 + this.buttonX1) / 2.0, (this.buttonY0 + this.buttonY1) / 2.0
             ,this.buttonX1 - this.buttonX0, this.buttonY1 - this.buttonY0);
    }
    
    void setMode() {
        Paint.mode = Paint.modeSending;
    }
    
    public void sendData() {
        byte[] pointToByteArray = new byte[4];
        int temp_x = 0;
        int temp_y = 0;
        
        if (realPointList.size() < 2) {
            return;
        }
        
        pointToByteArray[0] = (byte)(255);
        pointToByteArray[1] = (byte)(255);
        pointToByteArray[2] = (byte)(255);
        pointToByteArray[3] = (byte)(255);
        //while(sendDataStatus[0] != REQUEST_DATA){};
        myPort.write(pointToByteArray);
        Paint.sendDataStatus[0] = 0;
        println("here1");
        
        //temp_x = round(realPointList.get(0).getX());
        //temp_y = round(realPointList.get(0).getY());
        //pointToByteArray[0] = (byte)(temp_x & 0xFF);
        //pointToByteArray[1] = (byte)((temp_x >> 8) & 0xFF);
        //pointToByteArray[2] = (byte)(temp_y & 0xFF);
        //pointToByteArray[3] = (byte)((temp_y >> 8) & 0xFF);
        //while(sendDataStatus[0] != REQUEST_DATA){
        //}
        //myPort.write(pointToByteArray);
        //sendDataStatus[0] = 0;
        //println("here2");
        
        //pointToByteArray[0] = (byte)(254);
        //pointToByteArray[1] = (byte)(254);
        //pointToByteArray[2] = (byte)(254);
        //pointToByteArray[3] = (byte)(254);
        //while(sendDataStatus[0] != REQUEST_DATA){
        //}
        //myPort.write(pointToByteArray);
        //sendDataStatus[0] = 0;
        
        //for(int i = 1; i < realPointList.size(); i++) {
        //    temp_x = round(realPointList.get(i).getX());
        //    temp_y = round(realPointList.get(i).getY());
        //    pointToByteArray[0] = (byte)(temp_x & 0xFF);
        //    pointToByteArray[1] = (byte)((temp_x >> 8) & 0xFF);
        //    pointToByteArray[2] = (byte)(temp_y & 0xFF);
        //    pointToByteArray[3] = (byte)((temp_y >> 8) & 0xFF);
        //    println("here3");
        //    //int hight = 0;
        //    //int low = 0;
        //    //hight = (int)(pointToByteArray[1]);
        //    //hight = hight & 0x00FF;
        //    //low = (int)(pointToByteArray[0]);
        //    //low = low & 0x00FF;
        //    //int result_x = hight * 256 + low;
        //    //hight = (int)(pointToByteArray[3]);
        //    //hight = hight & 0x00FF;
        //    //low = (int)(pointToByteArray[2]);
        //    //low = low & 0x00FF;
        //    //int result_y = hight * 256 + low;
        //    //println(temp_x + " " + result_x + " " + temp_y + " " + result_y);
        //    while(sendDataStatus[0] != REQUEST_DATA){};
        //    println("here4");
        //    myPort.write(pointToByteArray);
        //    sendDataStatus[0] = 0;           
        //}
        //pointToByteArray[0] = (byte)(255);
        //pointToByteArray[1] = (byte)(255);
        //pointToByteArray[2] = (byte)(255);
        //pointToByteArray[3] = (byte)(255);
        //while(sendDataStatus[0] != REQUEST_DATA){};
        //myPort.write(pointToByteArray);
        //sendDataStatus[0] = 0;
    }
}
