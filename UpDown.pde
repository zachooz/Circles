private Circle[] theCircles = new Circle[300];
private boolean down = false;
private int count = 0;
void setup(){
	size(1200,900);
	noStroke();
} 

void draw(){
	fill(0,0,0,20);
	rect(0,0,width,height);
	for(int i = 0; i<theCircles.length; i++){
		if(theCircles[i]!=null)
			theCircles[i].run();
	}
	for(int i = 20; i<(int)(Math.random()*22);i++){
		theCircles[count]=new Circle();
		if(count<theCircles.length-1)
			count++;
		else
			count=0;
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
	//UP AND DOWN
	private double yAccel=1;
	private double ySpeed=8;
	private double xSpeed=10;

	//PROPERTIES
	private float cr = 50;
	private int r;
	private int g;
	private int b;
	private float x;
	private float y;
	Circle(){
		r=(int)(Math.random()*256);
		g=(int)(Math.random()*256);
		b=(int)(Math.random()*256);
		x=(float)(-cr);
		y=(float)(Math.random()*height+1);
	}

	public void run(){
		move();
		drawCir();
	}

	private void move(){
		//UP AND DOWN
		if(y<height/2)
			ySpeed+=yAccel;
		else
			ySpeed-=yAccel;
   		x += xSpeed; 
    	y += ySpeed;



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

