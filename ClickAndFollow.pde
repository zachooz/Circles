private Circle[] theCircles = new Circle[100];
private boolean down = false;
private int count = 0;
void setup(){
	size(500,500);
	noStroke();
} 

void draw(){
	fill(0,0,0,20);
	rect(0,0,width,height);
	for(int i = 0; i<theCircles.length; i++){
		if(theCircles[i]!=null)
			theCircles[i].run();
	}

	if(down){
		theCircles[count]=new Circle();
		if(count<theCircles.length-1)
			count++;
		else
			count=0;
	}
}

public class Circle{

	private float cr = 50;
	private double aAccel=0;
	private double speed=0;
	private double angle=0;
	private double spdC;
	private int r;
	private int g;
	private int b;
	private float x;
	private float y;
	Circle(){
		spdC=Math.random()*0.1;
		r=(int)(Math.random()*256);
		g=(int)(Math.random()*256);
		b=(int)(Math.random()*256);
		x=(float)(Math.random()*width);
		y=(float)(Math.random()*height);
	}

	public void run(){
		move();
		drawCir();
	}

	private void move(){
	    if(dist(x,y,mouseX,mouseY)!=0){
	    	angle = Math.acos(((mouseX-x))/(dist(x,y,mouseX,mouseY)));
	    }
	    if((mouseY-y)<0){
	      angle*=-1;
	    }
	    if(x!=mouseX && y !=mouseY){
		  speed =Math.abs(Math.sqrt((x-mouseX)*(x-mouseX)+(y-mouseY)*(y-mouseY)))*spdC;
	    }
   		x += ((speed) * Math.cos(angle)); 
    	y += ((speed) * Math.sin(angle));
	}

	private void drawCir(){
		fill(r,g,b);
		ellipse(x,y,cr,cr);
	}
}

void mousePressed() {
	down=true;
}
void mouseReleased() {
  down = false;
}

