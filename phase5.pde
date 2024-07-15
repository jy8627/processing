int circleCount = 40;
float canvasSize = 400;
float r = 10;
int circlesPerRow, circlesPerColumn;
float tx, ty;

float[] xPositions = new float[circleCount];
float[] yPositions = new float[circleCount];
float[] vx = new float[circleCount];
float[] vy = new float[circleCount];

void setup() {
  size(400, 400);
  background(255);
  noStroke();
  
  circlesPerRow = int(sqrt(circleCount));
  circlesPerColumn = circleCount / circlesPerRow;
  tx = canvasSize / circlesPerRow;
  ty = canvasSize / circlesPerColumn;
  
  for (int row = 0; row < circlesPerColumn; row++) {
    for (int col = 0; col < circlesPerRow; col++) {
      int index = row * circlesPerRow + col;
      xPositions[index] = col * tx + tx / 2;
      yPositions[index] = row * ty + ty / 2;
      vx[index] = random(-2, 2);
      vy[index] = random(-2, 5);
    }
  }
}

void draw() {
  background(255);

  for (int row = 0; row < circlesPerColumn; row++) {
    for (int col = 0; col < circlesPerRow; col++) {
      int index = row * circlesPerRow + col;
      
      // Update positions
      xPositions[index] += vx[index];
      yPositions[index] += vy[index];
      
      // Check for collisions with the canvas edges and reverse direction if necessary
      if (xPositions[index] - tx / 2 < 0 || xPositions[index] + tx / 2 > width) {
        vx[index] *= -1;
      }
      if (yPositions[index] - ty / 2 < 0 || yPositions[index] + ty / 2 > height) {
        vy[index] *= -1;
      }
      
      float x = xPositions[index];
      float y = yPositions[index];
      
      pushMatrix();
      translate(x, y); // Move origin to circle center
      float s = tx / r;
      scale(s); // Apply scaling
      stroke(0);
      strokeWeight(0.1);
      noFill(); // Random color
      ellipse(0, 0, r, r); // Draw circle at the new origin
      //fill(random(255), random(255), random(255));
      ellipse(0, 0, r, r/2);
      //fill(random(255), random(255), random(255));
      ellipse(0, 0, r, r/4);
      //fill(random(255), random(255), random(255));
      ellipse(0, 0, r/2, r);
      //fill(random(255), random(255), random(255), 60);
      ellipse(0, 0, r/4, r);
      popMatrix();
    }
  }
}
